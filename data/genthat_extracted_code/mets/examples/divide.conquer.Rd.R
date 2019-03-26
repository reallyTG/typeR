library(mets)


### Name: divide.conquer
### Title: Split a data set and run function
### Aliases: divide.conquer

### ** Examples

library(timereg)
data(TRACE)
res <- divide.conquer(prop.odds,TRACE,
	     formula=Event(time,status==9)~chf+vf+age,n.sim=0,size=200)



