library(grattan)


### Name: student_repayment
### Title: HELP / HECS repayment amounts
### Aliases: student_repayment

### ** Examples

student_repayment(50e3, "2013-14", debt = 10e3) 
# 0 since below the threshold

student_repayment(60e3, "2013-14", debt = 10e3)
# above the threshold

student_repayment(60e3, "2013-14", debt = 0)
# above the threshold, but no debt



