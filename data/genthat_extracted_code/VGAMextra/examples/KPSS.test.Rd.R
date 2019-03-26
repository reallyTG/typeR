library(VGAMextra)


### Name: KPSS.test
### Title: KPSS tests for stationarity
### Aliases: KPSS.test

### ** Examples

set.seed(2802)
test <- KPSS.test(rnorm(20), type.H0 = "trend")
class(test)

test$crit.value



