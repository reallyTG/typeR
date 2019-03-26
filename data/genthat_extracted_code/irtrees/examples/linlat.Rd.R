library(irtrees)


### Name: linlat
### Title: Example Data: Sequential-Order Latent Variable Models
### Aliases: linlat
### Keywords: datasets

### ** Examples

str(linlat)
str(linlatT <- exogenize(linlat, 
	cbind(c(1,0,0), c(1,1,0), c(0,1,0), c(0,1,1), c(0,0,1)),
    endnode = rep(1:3, each=10), cross = rep(1:10, 3)))



