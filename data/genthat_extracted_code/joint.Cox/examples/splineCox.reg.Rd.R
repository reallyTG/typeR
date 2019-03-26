library(joint.Cox)


### Name: splineCox.reg
### Title: Fitting the Cox model with penalized splines using univariate
###   survival data
### Aliases: splineCox.reg
### Keywords: Spline Penalized likelihood estimation Cox regression LCV

### ** Examples

data(dataOvarian)
t.event=dataOvarian$t.event
event=dataOvarian$event
t.death=dataOvarian$t.death
death=dataOvarian$death
Z=dataOvarian$CXCL12
#splineCox.reg(t.event,event,Z,kappa=c(seq(10,1e+17,length=30)))



