library(spatstat)


### Name: by.ppp
### Title: Apply a Function to a Point Pattern Broken Down by Factor
### Aliases: by.ppp
### Keywords: spatial methods manip

### ** Examples

  # multitype point pattern, broken down by type
  data(amacrine)
  by(amacrine, FUN=density)
  by(amacrine, FUN=function(x) { min(nndist(x)) } )

  # how to pass additional arguments to FUN
  by(amacrine, FUN=clarkevans, correction=c("Donnelly","cdf"))

  # point pattern broken down by tessellation
  data(swedishpines)
  tes <- quadrats(swedishpines, 5, 5)
  B <- by(swedishpines, tes, clarkevans, correction="Donnelly")
  unlist(lapply(B, as.numeric))



