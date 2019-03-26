library(marg)


### Name: residuals.rsm
### Title: Compute Residuals for Regression-Scale Models
### Aliases: residuals.rsm
### Keywords: methods models regression

### ** Examples

## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
##
residuals(venice.rsm)
## deviance residuals with observed weights
residuals(venice.rsm, type = "r.star", weighting = "score")
## r* residuals with score weights
detach()



