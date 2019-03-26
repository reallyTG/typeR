library(TTR)


### Name: ZigZag
### Title: Zig Zag
### Aliases: ZigZag zigzag
### Keywords: ts

### ** Examples


## Get Data and Indicator ##
data(ttrc)
zz <- ZigZag( ttrc[,c("High", "Low")], change=20 )




