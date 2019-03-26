library(spatstat.data)


### Name: demohyper
### Title: Demonstration Example of Hyperframe of Spatial Data
### Aliases: demohyper
### Keywords: datasets

### ** Examples

  if(require(spatstat)) {
 plot(demohyper, quote({ plot(Image, main=""); plot(Points, add=TRUE) }),
      parargs=list(mar=rep(1,4)))
 mppm(Points ~ Group/Image, data=demohyper)
  }



