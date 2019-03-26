library(scuba)


### Name: tanklist
### Title: Extract or Change the Breathing Gas Tanks in a Dive
### Aliases: tanklist tanklist<-
### Keywords: utilities

### ** Examples

   d <- dive(air, c(30,4), 5, nitrox(0.5), c(5,10))
   d
   tanklist(d)
   tanklist(d) <- list(air, nitrox(0.8))
   d
   tanklist(d) <- list(travel=air, deco=nitrox(0.8))
   d



