library(marg)


### Name: rsm.diag
### Title: Diagnostics for Regression-Scale Models
### Aliases: rsm.diag
### Keywords: models regression

### ** Examples

## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
venice.diag <- rsm.diag(venice.rsm)
## observed weights
detach()

## Darwin's Data on Growth Rates of Plants
data(darwin)
darwin.rsm <- rsm(cross-self ~ pot - 1, family = Huber, data = darwin)
darwin.diag <- rsm.diag(darwin.rsm)
## score weights



