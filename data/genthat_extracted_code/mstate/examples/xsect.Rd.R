library(mstate)


### Name: xsect
### Title: Make a cross-section of multi-state data at a given time point
### Aliases: xsect
### Keywords: univar

### ** Examples

tmat <- trans.illdeath(names=c("Tx","PR","RelDeath"))
data(ebmt3) # data from Section 4 of Putter, Fiocco & Geskus (2007)
msebmt <- msprep(time=c(NA,"prtime","rfstime"),status=c(NA,"prstat","rfsstat"),
		data=ebmt3,trans=tmat)
# At the start everyone is in state 1 (default xtime=0 is used)
xsect(msebmt)
# At 5 years
xsect(msebmt, xtime=1826)



