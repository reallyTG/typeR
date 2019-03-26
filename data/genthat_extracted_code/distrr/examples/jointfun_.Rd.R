library(distrr)


### Name: jointfun_
### Title: A minimal function which counts the number of observations by
###   groups in a data frame
### Aliases: jointfun_

### ** Examples

data("invented_wages")
tmp <- jointfun_(.data = invented_wages, .variables = c("gender", "sector"))
tmp
str(tmp)



