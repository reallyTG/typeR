library(MEPDF)


### Name: cube
### Title: cube
### Aliases: cube

### ** Examples

library("pracma")
library("plyr")

data<-cbind(rnorm(1000),rnorm(1000))

pdf<-cube(data,mx=c(1,1),mn=c(-1,-1),grid.sizes = c(0.01,0.01))



