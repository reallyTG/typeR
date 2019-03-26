library(contoureR)


### Name: convexHullAM
### Title: Convex Hull via Andrews Monotone, Rcpp Interface to C++ Routine
### Aliases: convexHullAM convexHullAM_Indexes convexHullAM_Points

### ** Examples

library(contoureR)
library(ggplot2)
set.seed(1)
x  = runif(100)
y  = runif(100)
ch = convexHullAM_Indexes(x,y,includeColinear=FALSE,zeroBased = FALSE)
ggplot(data.frame(x,y),aes(x,y)) +
 geom_point() +
 geom_path(data=data.frame(x,y)[ch,],colour="red")



