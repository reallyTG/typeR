library(rrcov)


### Name: CovMMest
### Title: MM Estimates of Multivariate Location and Scatter
### Aliases: CovMMest
### Keywords: robust multivariate

### ** Examples


library(rrcov)
data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
CovMMest(hbk.x)

## the following four statements are equivalent
c0 <- CovMMest(hbk.x)
c1 <- CovMMest(hbk.x, bdp = 0.25)
c2 <- CovMMest(hbk.x, control = CovControlMMest(bdp = 0.25))
c3 <- CovMMest(hbk.x, control = new("CovControlMMest", bdp = 0.25))

## direct specification overrides control one:
c4 <- CovMMest(hbk.x, bdp = 0.40,
             control = CovControlMMest(bdp = 0.25))
c1
summary(c1)
plot(c1)

## Deterministic MM-estmates
CovMMest(hbk.x, control=CovControlMMest(sest=CovControlSest(method="sdet")))




