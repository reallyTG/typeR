library(npsm)


### Name: fkk.test
### Title: k-Sample version of the Fligner-Kileen test for homogeneous
###   scales.
### Aliases: fkk.test

### ** Examples

y1 <- rnorm(10)
y2 <- rnorm(12)*3
y3 <- rnorm(15)*5
y<-c(y1,y2,y3)
ind<-rep(1:3,times=c(10,12,15))
fkk.test(y,ind)



