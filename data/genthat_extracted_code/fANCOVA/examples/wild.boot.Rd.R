library(fANCOVA)


### Name: wild.boot
### Title: Generate one or multiple bootstrap samples of regression
###   residuals using the wild bootstrap method
### Aliases: wild.boot
### Keywords: bootstrap wild bootstrap regression

### ** Examples

n <- 1000
x <- runif(n, min=0, max=1)
## generate heteroscedastic error variances
sig.x <- sqrt(exp(x)/2.5-0.4)
err <- sapply(sig.x, function(x) rnorm(1, sd=x))
x2 <- x^2
y <- 10+3*x+2*x2 +err
plot(x,y)
fit <- lm(y ~ x + x2)
## obtain 12 samples of the wild bootstrap residuals 
res.boot <- wild.boot(fit$res, nboot=12)
## obtain 12 samples of the wild bootstrap responses
y.boot <- matrix(rep(fit$fit,time=12), ncol=12) + res.boot
## plot the 12 wild bootstrap samples
## The wild bootstrap method keeps the patterns of variance heterogeneity 
## in the orginal sample.
par(mfrow=c(4,3))
for (i in 1:12) plot(x, y.boot[,i])




