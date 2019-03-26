library(sesem)


### Name: make.covar
### Title: Function to calculate covariance matrices for a set of lag
###   distance bins
### Aliases: make.covar
### Keywords: spatial

### ** Examples

data=truelove
truelove_red<-truelove[c(1:60),c(1:5)]
distancematrix<-calc.dist(truelove_red)

#calc.dist and make.covar can be time consuming to run, 
# therefore only a small dataset utilized here

Truelove_bins<-make.bin(distancematrix,type="ALL",p.dist=5)
binsize<-Truelove_bins[1][[1]] #truelove lowland bin sizes
binname<-Truelove_bins[2][[1]] #truelove lowland bin names

covariances<-make.covar(truelove_red,distancematrix,binsize,binname)
covariances



