library(mbbefd)


### Name: fitDR
### Title: Fit of destruction rate models
### Aliases: fitDR
### Keywords: distribution

### ** Examples


# (1) fit of a one-inflated beta distribution by maximum likelihood estimation
#
n <- 1e3
set.seed(12345)
x <- roibeta(n, 3, 2, 1/6)

f1 <- fitDR(x, "oibeta", method="mle")
summary(f1)

plot(bootdist(f1, niter=11), enhance=TRUE, trueval=c(3, 2, 1/6))




