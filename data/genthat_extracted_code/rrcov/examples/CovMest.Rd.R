library(rrcov)


### Name: CovMest
### Title: Constrained M-Estimates of Location and Scatter
### Aliases: CovMest
### Keywords: robust multivariate

### ** Examples


library(rrcov)
data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
CovMest(hbk.x)

## the following four statements are equivalent
c0 <- CovMest(hbk.x)
c1 <- CovMest(hbk.x, r = 0.45)
c2 <- CovMest(hbk.x, control = CovControlMest(r = 0.45))
c3 <- CovMest(hbk.x, control = new("CovControlMest", r = 0.45))

## direct specification overrides control one:
c4 <- CovMest(hbk.x, r = 0.40,
             control = CovControlMest(r = 0.25))
c1
summary(c1)
plot(c1)



