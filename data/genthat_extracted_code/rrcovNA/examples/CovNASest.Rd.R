library(rrcovNA)


### Name: CovNASest
### Title: S Estimates of Multivariate Location and Scatter for incomplete
###   data
### Aliases: CovNASest
### Keywords: robust multivariate

### ** Examples


library(rrcov)
data(bush10)
CovNASest(bush10)

## the following four statements are equivalent
c0 <- CovNASest(bush10)
c1 <- CovNASest(bush10, bdp = 0.25)
c2 <- CovNASest(bush10, control = CovControlSest(bdp = 0.25))
c3 <- CovNASest(bush10, control = new("CovControlSest", bdp = 0.25))

## direct specification overrides control one:
c4 <- CovNASest(bush10, bdp = 0.40,
             control = CovControlSest(bdp = 0.25))
c1
summary(c1)

## Use the SURREAL algorithm of Ruppert
cr <- CovNASest(bush10, method="surreal")
cr

## Use Bisquare estimation
cr <- CovNASest(bush10, method="bisquare")
cr

## Use Rocke type estimation
cr <- CovNASest(bush10, method="rocke")
cr





