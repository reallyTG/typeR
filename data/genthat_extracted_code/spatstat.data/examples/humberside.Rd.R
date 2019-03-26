library(spatstat.data)


### Name: humberside
### Title: Humberside Data on Childhood Leukaemia and Lymphoma
### Aliases: humberside humberside.convex
### Keywords: datasets spatial

### ** Examples

  if(require(spatstat)) {
   humberside
   summary(humberside)
   plot(humberside)
   plot(Window(humberside.convex), add=TRUE, lty=2)
  }



