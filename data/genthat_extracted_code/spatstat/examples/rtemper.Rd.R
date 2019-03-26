library(spatstat)


### Name: rtemper
### Title: Simulated Annealing or Simulated Tempering for Gibbs Point
###   Processes
### Aliases: rtemper
### Keywords: spatial datagen

### ** Examples

   stra <- rmhmodel(cif="strauss",
                    par=list(beta=2,gamma=0.2,r=0.7),
                    w=square(10))
   nr <- if(interactive()) 1e5 else 1e4
   Y <- rtemper(stra, c(1, 2, 4, 8), nr * (1:4), verbose=TRUE)



