library(REPPlab)


### Name: EPPlabAgg
### Title: Function to Aggregate Directions From epplab Objects
### Aliases: EPPlabAgg
### Keywords: multivariate

### ** Examples


 library(tourr)
 data(olive)
 # To keep the runtime short, maxiter and n.simu were chosen very 
 # small for demonstration purposes, real life applications would
 # rather choose larger values, e.g. n.simu=100, maxiter=200
 olivePP.kurt.max <-
   EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMax",n.simu=10, maxiter=20)
 
 olivePP.fried <-
   EPPlab(olive[,3:10],PPalg="PSO",PPindex="Friedman",n.simu=10, maxiter=20)
 
 olivePPs <- list(olivePP.kurt.max, olivePP.fried)
 
 EPPlabAgg(olivePP.kurt.max)$k
 EPPlabAgg(olivePPs, "cum", 0.99)$k
 
 pairs(olivePP.kurt.max$x %*% EPPlabAgg(olivePPs, "cum", 0.99)$O,
       col=olive[,2], pch=olive[,1])
 
 
 olivAOP.sq <- EPPlabAgg(olivePPs, "inv")
 oliveProj <- olivePP.kurt.max$x %*% olivAOP.sq$O
 plot(density(oliveProj))
 rug(oliveProj[olive$region==1],col=1)
 rug(oliveProj[olive$region==2],col=2)
 rug(oliveProj[olive$region==3],col=3)




