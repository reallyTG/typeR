library(growth)


### Name: potthoff
### Title: Potthoff and Roy Growth Curve Model
### Aliases: potthoff
### Keywords: models

### ** Examples


y <- matrix(rnorm(40),ncol=5)
x <- gl(2,4)
# full model with treatment effect
potthoff(y, ~x, torder="f", ccov=~x)
# no time trend with treatment effect
potthoff(y, ~x, torder=0, ccov=~x)
# quadratic time with treatment effect
potthoff(y, ~x, torder=2, ccov=~x)
# full model without treatment effect
potthoff(y, ~x, torder="f")
# linear time without treatment effect
potthoff(y, ~x, torder=1)




