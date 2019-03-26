library(validate)


### Name: summary
### Title: Create a summary
### Aliases: summary summary,expressionset-method summary,indication-method
###   validate-summary summary,validation-method

### ** Examples

data(retailers)
v <- validator(staff > 0, staff.costs/staff < 20, turnover+other.revenue == total.revenue)
summary(v)

cf <- confront(retailers,v)
summary(cf)





