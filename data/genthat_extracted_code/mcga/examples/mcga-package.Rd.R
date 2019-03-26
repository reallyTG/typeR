library(mcga)


### Name: mcga-package
### Title: Machine Coded Genetic Algorithms for Real-valued Optimization
###   Problems
### Aliases: mcga-package

### ** Examples

## Not run: 
##D # A sample optimization problem
##D # Min f(xi) = (x1-7)^2 + (x2-77)^2 + (x3-777)^2 + (x4-7777)^2 + (x5-77777)^2
##D # The range of xi is unknown. The solution is
##D # x1 = 7
##D # x2 = 77
##D # x3 = 777
##D # x4 = 7777
##D # x5 = 77777
##D # Min f(xi) = 0
##D require("mcga")
##D  f<-function(x){
##D     return ((x[1]-7)^2 + (x[2]-77)^2 +(x[3]-777)^2 +(x[4]-7777)^2 +(x[5]-77777)^2)
##D  }
##D  m <- mcga(	popsize=200, 
##D 			chsize=5, 
##D 			minval=0.0, 
##D 			maxval=999999999.9, 
##D 			maxiter=2500, 
##D 			crossprob=1.0, 
##D 			mutateprob=0.01, 
##D 			evalFunc=f)
##D 			
##D  cat("Best chromosome:\n")
##D  print(m$population[1,])
##D  cat("Cost: ",m$costs[1],"\n")
## End(Not run)



