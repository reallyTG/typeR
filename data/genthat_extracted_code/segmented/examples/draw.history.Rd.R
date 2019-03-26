library(segmented)


### Name: draw.history
### Title: History for the breakpoint estimates
### Aliases: draw.history
### Keywords: regression nonlinear

### ** Examples

data(stagnant)
os<-segmented(lm(y~x,data=stagnant),seg.Z=~x,psi=-.8)
draw.history(os) #diagnostics with boot restarting

os<-segmented(lm(y~x,data=stagnant),seg.Z=~x,psi=-.8, control=seg.control(n.boot=0))
draw.history(os) #diagnostics without boot restarting




