library(irtrees)


### Name: exogenize
### Title: Structural Mapping for an IRTree Model
### Aliases: exogenize
### Keywords: models

### ** Examples

str(linlatT <- exogenize(linlat, 
   cbind(c(1,0,0), c(1,1,0), c(0,1,0), c(0,1,1), c(0,0,1)),
   endnode = rep(1:3, each=10), cross = rep(1:10, 3)))



