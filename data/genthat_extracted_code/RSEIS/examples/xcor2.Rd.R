library(RSEIS)


### Name: xcor2
### Title: Cross Correlation
### Aliases: xcor2
### Keywords: misc

### ** Examples


data(CE1)

ts1 <- CE1$y[CE1$x>5.443754 & CE1$x<5.615951]

ts2 <- CE1$y[CE1$x>5.760959]
ts2 <- ts2[1:length(ts1)]

ts1 <- ts1-mean(ts1)
ts2 <- ts2-mean(ts2)

xc <- xcor2(ts1, ts2, CE1$dt , PLOT = TRUE)




