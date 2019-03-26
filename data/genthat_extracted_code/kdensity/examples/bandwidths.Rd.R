library(kdensity)


### Name: bandwidths
### Title: Bandwidth Selectors
### Aliases: bandwidths

### ** Examples

   ## Not a serious bandwidth function.
   silly_width = function(x, kernel = NULL, start = NULL, support = NULL) {
     rexp(1)
   }
   kdensity(mtcars$mpg, start = "gumbel", bw = silly_width)



