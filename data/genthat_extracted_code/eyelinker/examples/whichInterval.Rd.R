library(eyelinker)


### Name: whichInterval
### Title: From a set of intervals, find which interval values belong to
### Aliases: whichInterval

### ** Examples

start <- c(0,1,2)
end <- c(.5,1.3,3)
intv <- cbind(start,end) #The first interval is 0-0.5, second is 1-1.3, etc. 
whichInterval(seq(0,3,l=10),intv)



