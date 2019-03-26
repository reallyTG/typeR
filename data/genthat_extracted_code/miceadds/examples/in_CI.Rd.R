library(miceadds)


### Name: in_CI
### Title: Indicator Function for Analyzing Coverage
### Aliases: in_CI

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example
#############################################################################

#-- simulate estimates and standard errors
set.seed(987)
n <- 10
est <- stats::rnorm( n, sd=1)
se <- stats::runif( n, 0, .7 )
level <- .95
true <- 0

#-- apply coverage function
in_ci <- miceadds::in_CI( est, se, true)
#-- check correctness
cbind( est, se, true, in_ci )



