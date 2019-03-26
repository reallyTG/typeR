library(spatstat)


### Name: Extract.solist
### Title: Extract or Replace Subset of a List of Spatial Objects
### Aliases: [.solist [<-.solist
### Keywords: spatial list manip

### ** Examples

   x <- solist(japanesepines, cells, redwood)
   x[2:3]
   x[square(0.5)]
   x[1] <- list(finpines)
 


