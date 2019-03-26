library(rrcov)


### Name: CovSest
### Title: S Estimates of Multivariate Location and Scatter
### Aliases: CovSest
### Keywords: robust multivariate

### ** Examples


library(rrcov)
data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
cc <- CovSest(hbk.x)
cc

## summry and different types of plots
summary(cc)                         
plot(cc)                            
plot(cc, which="dd")
plot(cc, which="pairs")
plot(cc, which="xydist")

## the following four statements are equivalent
c0 <- CovSest(hbk.x)
c1 <- CovSest(hbk.x, bdp = 0.25)
c2 <- CovSest(hbk.x, control = CovControlSest(bdp = 0.25))
c3 <- CovSest(hbk.x, control = new("CovControlSest", bdp = 0.25))

## direct specification overrides control one:
c4 <- CovSest(hbk.x, bdp = 0.40,
             control = CovControlSest(bdp = 0.25))
c1
summary(c1)
plot(c1)

## Use the SURREAL algorithm of Ruppert
cr <- CovSest(hbk.x, method="surreal")
cr

## Use Bisquare estimation
cr <- CovSest(hbk.x, method="bisquare")
cr

## Use Rocke type estimation
cr <- CovSest(hbk.x, method="rocke")
cr

## Use Deterministic estimation
cr <- CovSest(hbk.x, method="sdet")
cr




