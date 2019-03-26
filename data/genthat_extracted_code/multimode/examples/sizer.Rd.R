library(multimode)


### Name: sizer
### Title: SIgnificant ZERo crossing
### Aliases: sizer
### Keywords: graphical tools

### ** Examples

#SiZer map using a grid of bandwidths between 1 and 10
data(geyser)
data=geyser
sizer(data,bws=c(1,10))

## Not run: 
##D #Different methods for calculating the confidence limits
##D 
##D #Pointwise Gaussian quantiles
##D sizer(data,method=1,bws=c(1,10))
##D 
##D #Approximate simultaneous over x Gaussian quantiles
##D sizer(data,method=2,bws=c(1,10))
##D 
##D #Bootstrap quantile simultaneous over x
##D sizer(data,method=3,bws=c(1,10))
##D 
##D #Bootstrap quantile simultaneous over x and h
##D sizer(data,method=4,bws=c(1,10))
## End(Not run)

#Adding the original mode tree for this sample
modetree(data,bws=c(0.8,10),logbw=TRUE,addplot=TRUE,col.lines="white")




