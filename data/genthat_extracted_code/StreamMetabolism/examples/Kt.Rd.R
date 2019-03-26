library(StreamMetabolism)


### Name: Kt
### Title: Temperature Correction For Reaeration Value
### Aliases: Kt
### Keywords: math

### ** Examples

#data USGS
data(DOTemp)
#velocity 0.6, depth 0.4572
d <- ODobbins(0.6, 0.4572)
Kcorr <- Kt(d , DOTemp[,1])



