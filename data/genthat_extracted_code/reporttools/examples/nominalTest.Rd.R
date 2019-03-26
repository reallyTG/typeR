library(reporttools)


### Name: nominalTest
### Title: Compute Chi square or Fisher's exact test
### Aliases: nominalTest
### Keywords: htest

### ** Examples

v1 <- as.factor(round(runif(40, 0, 3)))
v2 <- as.factor(round(runif(40, 2, 3)))
tab <- table(v1, v2)
nominalTest(tab)



