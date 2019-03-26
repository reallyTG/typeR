library(sesem)


### Name: plotbin
### Title: Function to plot the distribution of lag distance bin sizes
### Aliases: plotbin
### Keywords: ~spatial

### ** Examples

data=plantcomp
distancematrix<-calc.dist(plantcomp[c(1:100),])
#using subset of plantcomp dataset to cut computation time
Plant_bins<-make.bin(distancematrix,type="s.size",s.size=200) 
#inference distance=50% AND sample size=200
binsize<-Plant_bins[1][[1]] #plant competition bin sizes

plotbin(distancematrix,binsize)




