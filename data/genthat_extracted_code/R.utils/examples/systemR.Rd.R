library(R.utils)


### Name: systemR
### Title: Launches another R process from within R
### Aliases: systemR.default systemR systemR
### Keywords: programming IO

### ** Examples

res <- systemR("--slave -e cat(runif(1))", intern=TRUE)
cat("A random number: ", res, "\n", sep="")



