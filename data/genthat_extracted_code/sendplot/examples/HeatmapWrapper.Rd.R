library(sendplot)


### Name: HeatmapWrapper
### Title: INTERACTIVE HEATMAP - DEPRECATED
### Aliases: HeatmapWrapper heatmap.send.legacy
### Keywords: methods

### ** Examples


rm(list=ls())
library(sendplot)

# mock matrix of values
temp = matrix(rnorm(15), nrow=5, ncol=3)

# color bars for samples
rcol = c("red", "blue", "yellow", "purple", "blue")
ccol = c("black", "green", "black")

# matrix of values to display in interactive window
temp.inv = list()
temp.inv$sample.ID = c("smp1", "smp2", "smp3")
temp.inv$count = 1:3
temp.inv$bb = 3:1
temp.inv = as.data.frame(temp.inv)

# matrix of values to display in interactive window
loc.inv = list()
loc.inv$spot = c("sp1", "sp2", "sp3","sp4","sp5")
loc.inv$vv = 1:5
loc.inv$bv = 5:1
loc.inv = as.data.frame(loc.inv)


#set up temporary directory
direct = paste(tempdir(),"/",sep="")
direct

heatmap.send.legacy(temp, RowSideColors=rcol, ColSideColors=ccol,
x.lbls=temp.inv, y.lbls=loc.inv, bound.pt=FALSE, paint=FALSE,
spot.radius=20, dir=direct)


# or display heatmap without color bands 
heatmap.send.legacy(temp, x.lbls=temp.inv, y.lbls=loc.inv, bound.pt=FALSE,
paint=FALSE, spot.radius=20,dir=direct)


# or without cluster
heatmap.send.legacy(temp, Rowv=NA, Colv=NA, x.lbls=temp.inv, y.lbls=loc.inv, bound.pt=FALSE,
paint=FALSE, spot.radius=20,dir=direct)





