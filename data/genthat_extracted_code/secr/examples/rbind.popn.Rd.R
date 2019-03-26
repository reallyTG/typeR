library(secr)


### Name: rbind.popn
### Title: Combine popn Objects
### Aliases: rbind.popn
### Keywords: manip

### ** Examples


## generate and combine two subpopulations
trapobj <- make.grid()
p1 <- sim.popn(D = 3, core = trapobj)
p2 <- sim.popn(D = 2, core = trapobj)
covariates(p1) <- data.frame(size = rep("small", nrow(p1)))
covariates(p2) <- data.frame(size = rep("large", nrow(p2)))
pop <- rbind(p1,p2)

## or
pop <- do.call(rbind, list(p1,p2))




