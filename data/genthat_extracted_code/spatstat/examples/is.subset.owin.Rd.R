library(spatstat)


### Name: is.subset.owin
### Title: Determine Whether One Window is Contained In Another
### Aliases: is.subset.owin
### Keywords: spatial math

### ** Examples

   w1 <- as.owin(c(0,1,0,1))
   w2 <- as.owin(c(-1,2,-1,2))
   is.subset.owin(w1,w2)  # Returns TRUE.
   is.subset.owin(w2,w1)  # Returns FALSE.



