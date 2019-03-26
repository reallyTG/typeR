library(capushe)


### Name: DDSE
### Title: Model selection by Data-Driven Slope Estimation
### Aliases: DDSE DDSE-class plot,DDSE-method print,DDSE-method
###   show,DDSE-method summary,DDSE-method validation,DDSE-method
###   print.DDSE show.DDSE summary.DDSE ddse Ddse Data-Driven data-driven
###   Data-driven
### Keywords: models

### ** Examples

data(datacapushe)
DDSE(datacapushe)
plot(DDSE(datacapushe))
## DDSE with "lm" for the regression
DDSE(datacapushe,psi.rlm="lm")



