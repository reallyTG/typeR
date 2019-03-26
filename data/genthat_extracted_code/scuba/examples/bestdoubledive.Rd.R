library(scuba)


### Name: bestdoubledive
### Title: Find the Best Double Dive To Given Depths
### Aliases: bestdoubledive
### Keywords: utilities

### ** Examples

   d <- bestdoubledive(40, 12, 15)
   plot(d)
   # Table 3 in Baddeley and Bassom (2012)
   bestdoubledive(40, 12, 15, verbose=TRUE)
   # Brief description of optimal dive
   summary(bestdoubledive(40, 12, 15))
   # Data for optimal dive
   bestdoubledive(40, 12, 15, asdive=FALSE)



