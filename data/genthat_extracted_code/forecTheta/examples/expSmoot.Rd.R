library(forecTheta)


### Name: expSmoot
### Title: Simple Exponential Smoothing Method
### Aliases: expSmoot
### Keywords: simple exponential smoothing

### ** Examples


y1 = 2+ 0.15*(1:20) + rnorm(20,2)
y2 = y1[20]+ 0.3*(1:30) + rnorm(30,2)
y =  as.ts(c(y1,y2))

expSmoot(y, h=10)




