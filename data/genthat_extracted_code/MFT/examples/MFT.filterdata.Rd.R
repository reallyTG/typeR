library(MFT)


### Name: MFT.filterdata
### Title: MFT.filterdata
### Aliases: MFT.filterdata

### ** Examples

set.seed(0)
# Normally distributed sequence with negative trend
x <- rnorm(1000,mean=seq(5,0,length.out=1000))
MFT.filterdata(x)
MFT.filterdata(x,filterwidth=200,filtersigma=200)




