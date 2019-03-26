library(lava)


### Name: partialcor
### Title: Calculate partial correlations
### Aliases: partialcor
### Keywords: models regression

### ** Examples


m <- lvm(c(y1,y2,y3)~x1+x2)
covariance(m) <- c(y1,y2,y3)~y1+y2+y3
d <- sim(m,500)
partialcor(~x1+x2,d)




