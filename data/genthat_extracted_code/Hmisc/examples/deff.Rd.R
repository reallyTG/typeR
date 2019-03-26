library(Hmisc)


### Name: deff
### Title: Design Effect and Intra-cluster Correlation
### Aliases: deff
### Keywords: htest

### ** Examples

set.seed(1)
blood.pressure <- rnorm(1000, 120, 15)
clinic <- sample(letters, 1000, replace=TRUE)
deff(blood.pressure, clinic)



