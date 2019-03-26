library(McSpatial)


### Name: maketarget
### Title: Target Points for Nonparametric Models
### Aliases: maketarget

### ** Examples

data(cookdata)
target <- maketarget(~LONGITUDE+LATITUDE,window=.25,data=cookdata)$target



