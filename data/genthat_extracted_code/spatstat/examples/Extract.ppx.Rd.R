library(spatstat)


### Name: Extract.ppx
### Title: Extract Subset of Multidimensional Point Pattern
### Aliases: [.ppx
### Keywords: spatial manip

### ** Examples

   df <- data.frame(x=runif(4),y=runif(4),z=runif(4))
   X <- ppx(data=df, coord.type=c("s","s","t"))
   X[-2]



