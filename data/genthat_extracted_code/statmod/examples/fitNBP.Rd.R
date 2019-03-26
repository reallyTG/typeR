library(statmod)


### Name: fitNBP
### Title: Negative Binomial Model for SAGE Libraries with Pearson
###   Estimation of Dispersion
### Aliases: fitNBP
### Keywords: regression

### ** Examples

# True value for dispersion is 1/size=2/3
# Note the Pearson method tends to under-estimate the dispersion
y <- matrix(rnbinom(10*4,mu=4,size=1.5),10,4)
lib.size <- rep(50000,4)
group <- c(1,1,2,2)
fit <- fitNBP(y,group=group,lib.size=lib.size)
logratio <- fit$coef %*% c(-1,1)



