library(ilc)


### Name: elca.rh
### Title: Extended (Stratified) Lee-Carter model (with a single extra
###   parameter)
### Aliases: elca.rh
### Keywords: method

### ** Examples

rfp <- c(0.5, 1.2, -0.7, 2.5)
rfp.cmi <- dd.rfp(dd.cmi.pens, rfp)
mod6e <- elca.rh(rfp.cmi, age=50:100, interp=TRUE, dec=3, verb=TRUE)
# display model summary and diagnostics:
mod6e; coef(mod6e)



