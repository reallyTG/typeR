library(saws)


### Name: mgee
### Title: Modified gee function to output extra objects for saws
### Aliases: mgee
### Keywords: nonlinear

### ** Examples

##  example from gee help
data(warpbreaks)
mout<-mgee(breaks~tension,id=wool,data=warpbreaks,corstr="exchangeable")
saws(mout)



