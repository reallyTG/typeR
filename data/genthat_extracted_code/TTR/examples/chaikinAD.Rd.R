library(TTR)


### Name: chaikinAD
### Title: Chaikin Accumulation / Distribution
### Aliases: chaikinAD
### Keywords: ts

### ** Examples


data(ttrc)
ad <- chaikinAD(ttrc[,c("High","Low","Close")], ttrc[,"Volume"])




