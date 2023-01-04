# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    DISTINCT yr
  FROM
    (SELECT 
      yr, subject
    FROM 
      nobels
    WHERE NOT
      subject = 'Chemistry') as without_chem
  WHERE
    subject = 'Physics';

    SQL
end
