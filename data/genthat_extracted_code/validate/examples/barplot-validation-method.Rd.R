library(validate)


### Name: barplot,validation-method
### Title: Plot number of violations
### Aliases: barplot,validation-method

### ** Examples

data(retailers)
cf <- check_that(retailers
    , staff.costs < total.costs
    , turnover + other.rev == total.rev
    , other.rev > 0
    , total.rev > 0)
barplot(cf)




