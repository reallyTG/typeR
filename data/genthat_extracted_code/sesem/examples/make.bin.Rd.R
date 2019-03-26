library(sesem)


### Name: make.bin
### Title: Function to make lag distance bins
### Aliases: make.bin
### Keywords: spatial

### ** Examples


data=truelove
distdata<-truelove[c(1:60),]
distances<-calc.dist(distdata)
Truelove_bins<-make.bin(distances,type="ALL") 
#	inference distance=50% AND number of bins=ALL
#	note the need to extract sizes and names from the bin size object 
#	as shown below for use in function make.covar
binsize<-Truelove_bins[1][[1]] #truelove lowland bin sizes
binsize
binname<-Truelove_bins[2][[1]] #truelove lowland bin names
binname

# function make.bin to generate bins with 120 samples each to a maximum inference 
# distance of 20% note the need to extract sizes and names from the bin size object 
# as shown below for use in make.covar

data=plantcomp
distdata<-plantcomp[c(1:60),]
distances<-calc.dist(distdata)
#using subset of plantcomp dataset to cut computation time
Plant_bins<-make.bin(distances,type="s.size",s.size=60,p.dist=20) 
#inference distance=20% AND sample size=120
#	note the need to extract sizes and names from the bin size object 
#	as shown below for use in function make.covar
binsize<-Plant_bins[1][[1]] #plant competition bin sizes
binsize
binname<-Plant_bins[2][[1]] #plant competition bin names
binname

# if manual bin sizes are needed use the following approach. 
# Note that the bin name vector must have one fewer elements than bin size
	
binsize = c(0,1,2,2.2,4,5,8,16,32,64,96,128,160)
binsize
binname=c("Bin1","Bin2","Bin3","Bin4","Bin5","Bin6","Bin7","Bin8",
	"Bin9","Bin10","Bin11","Bin12")
binname



