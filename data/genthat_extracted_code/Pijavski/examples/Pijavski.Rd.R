library(Pijavski)


### Name: Pijavski
### Title: Global univariate minimization of Lipschitz functions using
###   Pijavski method
### Aliases: Pijavski
### Keywords: optimize

### ** Examples

 optimize_funcR <- function(x,y){
   y <- x * x
   return(y)
 }

 output<-Pijavski(optimize_funcR, 5, -2.0, 1.0, 1000, 10^-3,
         new.env(list(fn = optimize_funcR)))
 output

# named parameters
 output<-Pijavski(fn= optimize_funcR, Lips=4, a=-2.0, b=1.0, 
    iter=1000, prec=10^-3, env=new.env(list(fn = optimize_funcR)))

 output



