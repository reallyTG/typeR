library(TTR)


### Name: aroon
### Title: Aroon
### Aliases: aroon
### Keywords: ts

### ** Examples


## Get Data and Indicator ##
data(ttrc)
trend <- aroon( ttrc[,c("High", "Low")], n=20 )




