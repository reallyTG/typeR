library(mstate)


### Name: events
### Title: Count number of observed transitions
### Aliases: events
### Keywords: univar

### ** Examples

tmat <- trans.illdeath(names=c("Tx","PR","RelDeath"))
data(ebmt3) # data from Section 4 of Putter, Fiocco & Geskus (2007)
msebmt <- msprep(time=c(NA,"prtime","rfstime"),status=c(NA,"prstat","rfsstat"),
		data=ebmt3,trans=tmat)
events(msebmt) # see Fig 13 of Putter, Fiocco & Geskus (2007)



