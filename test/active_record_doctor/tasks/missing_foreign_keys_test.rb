require 'test_helper'

require 'active_record_doctor/tasks/missing_foreign_keys'

class ActiveRecordDoctor::Tasks::MissingForeignKeysTest < ActiveSupport::TestCase
  def test_missing_foreign_keys_are_reported
    result = run_task

    assert_equal({'users' => ['profile_id']}, result)
  end

  private

  def run_task
    printer = SpyPrinter.new
    ActiveRecordDoctor::Tasks::MissingForeignKeys.new(printer: printer).run
    printer.missing_foreign_keys
  end
end
