library(KRLS)


### Name: summary.krls
### Title: Summary method for Kernel-based Regularized Least Squares (KRLS)
###   Model Fits
### Aliases: summary.krls

### ** Examples

# non-linear example
# set up data
N <- 200
x1 <- rnorm(N)
x2 <- rbinom(N,size=1,prob=.2)
y <- x1^3 + .5*x2 + rnorm(N,0,.15)
X <- cbind(x1,x2)

# fit model
krlsout <- krls(X=X,y=y)
# summarize marginal effects and contribution of each variable
summary(krlsout)
# plot marginal effects and conditional expectation plots
plot(krlsout)




