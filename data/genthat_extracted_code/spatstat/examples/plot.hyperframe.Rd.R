library(spatstat)


### Name: plot.hyperframe
### Title: Plot Entries in a Hyperframe
### Aliases: plot.hyperframe
### Keywords: spatial hplot

### ** Examples

   H <- hyperframe(id=1:10)
   H$X <- with(H, rpoispp(100))
   H$D <- with(H, distmap(X))
   # points only
   plot(H[,"X"])
   plot(H, quote(plot(X, main=id)))
   # points superimposed on images
   plot(H, quote({plot(D, main=id); plot(X, add=TRUE)}))



