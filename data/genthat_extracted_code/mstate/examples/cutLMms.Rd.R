library(mstate)


### Name: cutLMms
### Title: Cut a multi-state data set at a landmark time point
### Aliases: cutLMms
### Keywords: univar

### ** Examples

tmat <- trans.illdeath(names=c("Tx","PR","RelDeath"))
data(ebmt3) # data from Section 4 of Putter, Fiocco & Geskus (2007)
msebmt <- msprep(time=c(NA,"prtime","rfstime"),status=c(NA,"prstat","rfsstat"),
		data=ebmt3,trans=tmat)
# Cut at 5 years
cutLMms(msebmt, LM=1826)
events(cutLMms(msebmt, LM=1826))



