library(gnFit)


### Name: gnfit
### Title: Goodness of Fit Test for Continuous Distribution Functions
### Aliases: gnfit

### ** Examples

library(rmutil)
r <- rlaplace(1000, m = 1, s = 2)
gnfit(r, "laplace")

library(ismev)
pr <- c(-0.5, 1, 0.2)
r <- gevq(pr, runif(1000, 0, 1))
model <- gev.fit(r)$mle
gnfit(r, "gev", pr = model)
## No test: 
library(ismev)
r <- gum.q(runif(1000, 0, 1), -0.5, 1)
n <- length(r)
time <- matrix(1:n, ncol=1)
model <- gum.fit(r, ydat=time, mul=1)$mle
mle<-dim(2)
mle[1] <- model[1] + model[2] * (n+1)
mle[2] <- model[3]
gnfit(r, "gum", pr = mle)
## End(No test)
## Don't show: 
r <- rt (1000, df=4)
gnfit(r, "t", df=4)
## End(Don't show)



