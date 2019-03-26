library(saws)


### Name: geeUOmega
### Title: Modified gee function to output extra objects for saws
### Aliases: geeUOmega
### Keywords: nonlinear

### ** Examples

##  example from gee help
data(warpbreaks)
geeout<-gee(breaks~tension,id=wool,data=warpbreaks,corstr="exchangeable")
guo<-geeUOmega(geeout)
saws(guo)



