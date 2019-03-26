library(supportInt)


### Name: calibSI
### Title: Attempts to find a support interval with the desired confidence
###   level for binomial, poisson or normal data.
### Aliases: calibSI

### ** Examples

set.seed(10)
calibSI(rnorm(15), family="normal", conf.level=.95, B=1000)



