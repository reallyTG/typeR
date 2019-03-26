library(mcga)


### Name: multi_mcga
### Title: Performs multi objective machine coded genetic algorithms.
### Aliases: multi_mcga

### ** Examples

## Not run: 
##D  # We have two objective functions.
##D  f1<-function(x){
##D    return(sin(x))
##D  }
##D 
##D  f2<-function(x){
##D    return(sin(2*x))
##D  }
##D 
##D  # This function returns a vector of cost functions for a given x sent from mcga
##D  f<-function(x){
##D    return ( c( f1(x), f2(x)) )
##D  }
##D 
##D  # main loop
##D  m<-multi_mcga(popsize=200, chsize=1, minval= 0, elitism=2, 
##D  	      maxval= 2.0 * pi, maxiter=1000, crossprob=1.0, 
##D 	      mutateprob=0.01, evalFunc=f, numfunc=2)
##D 
##D  # Points show best five solutions. 
##D  curve(f1, 0, 2*pi)
##D  curve(f2, 0, 2*pi, add=TRUE)
##D 
##D  p <- m$population[1:5,]
##D  points(p, f1(p))
##D  points(p, f2(p))
## End(Not run)



