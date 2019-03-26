library(clikcorr)


### Name: splot2
### Title: Graphical function 2 for visualizing bivariate censored and/or
###   missing data.
### Aliases: splot2

### ** Examples


data(ND)
logND <- log(ND)

splot2(logND, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678",
 "t2_HxCDF_234678", xlab="OCDD", ylab="HxCDF234678")

x <- logND[which(!is.na(logND[,14]) & !is.na(logND[,15])),14]
y <- logND[which(!is.na(logND[,26]) & !is.na(logND[,27])),26]
xhist = hist(x, plot=FALSE, breaks=10)
yhist = hist(y, plot=FALSE, breaks=10)
  
zones=matrix(c(2,0,1,3), ncol=2, byrow=TRUE)
layout(zones, widths=c(5/6,1/6), heights=c(1/6,5/6))
top = max(c(xhist$counts, yhist$counts))
par(mar=c(5,5,1,1))
splot2(logND, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678",
 "t2_HxCDF_234678", xlab="OCDD", ylab="HxCDF234678", cex=1.5)  

par(mar=c(0,6,2,4))
barplot(xhist$counts, axes=FALSE, ylim=c(0, max(xhist$counts)), space=0)
par(mar=c(6,0,4,2))
barplot(yhist$counts, axes=FALSE, xlim=c(0, max(yhist$counts)), space=0, horiz=TRUE)





