library(RWiener)


### Name: scorefun
### Title: Extract Empirical Estimating Functions
### Aliases: scorefun scorefun.wdm estfun estfun.wdm

### ** Examples

## generate random data
dat <- rwiener(100,1,.2,.5,0.5)

## fit wdm
wdm1 <- wdm(dat)

## estimating function
scores <- scorefun(wdm1)

## print
head(scores)

## plot
par(mfrow=c(2,2))
plot(scores[,1]);plot(scores[,2]);plot(scores[,3]);plot(scores[,4])



