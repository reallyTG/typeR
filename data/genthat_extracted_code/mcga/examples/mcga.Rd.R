library(mcga)


### Name: mcga
### Title: Performs machine coded genetic algorithms on a function subject
###   to be minimized.
### Aliases: mcga

### ** Examples

# A sample optimization problem
# Min f(xi) = (x1-7)^2 + (x2-77)^2 + (x3-777)^2 + (x4-7777)^2 + (x5-77777)^2
# The range of xi is unknown. The solution is
# x1 = 7
# x2 = 77
# x3 = 777
# x4 = 7777
# x5 = 77777
# Min f(xi) = 0
require("mcga")
 f<-function(x){
    return ((x[1]-7)^2 + (x[2]-77)^2 +(x[3]-777)^2 +(x[4]-7777)^2 +(x[5]-77777)^2)
 }
 m <- mcga(	popsize=200, 
			chsize=5, 
			minval=0.0, 
			maxval=999999999.9, 
			maxiter=2500, 
			crossprob=1.0, 
			mutateprob=0.01, 
			evalFunc=f)
			
 cat("Best chromosome:\n")
 print(m$population[1,])
 cat("Cost: ",m$costs[1],"\n")



