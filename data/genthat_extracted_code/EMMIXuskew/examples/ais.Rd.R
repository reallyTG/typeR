library(EMMIXuskew)


### Name: ais
### Title: Australian Institute of Sports (AIS) data
### Aliases: ais
### Keywords: datasets

### ** Examples

data(ais)
pairs(ais[,2:12], main = "AIS Data", pch = 21, 
    bg = c("red", "blue")[unclass(factor(ais$Sex))], upper.panel=NULL)
legend(0.8, 0.8,legend=c("male", "female"), pt.bg = c("red", "blue"), pch=21)



