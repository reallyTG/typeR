library(PracTools)


### Name: dub
### Title: Sample sizes for a double sampling design
### Aliases: dub
### Keywords: methods survey

### ** Examples

Wh <- rep(0.25,4)
Ph <- c(0.02,0.12,0.37,0.54)
Sh <- sqrt(Ph*(1-Ph))
c1 <- 10
c2 <- 50
Ctot <- 20000
dub(c1, c2, Ctot, Nh=Wh, Sh, Yh.bar=Ph)



