library(tsutils)


### Name: nemenyi
### Title: Nonparametric multiple comparisons (Nemenyi test)
### Aliases: nemenyi
### Keywords: htest

### ** Examples

x <- matrix( rnorm(50*4,mean=0,sd=1), 50, 4)
x[,2] <- x[,2]+1
x[,3] <- x[,3]+0.7
x[,4] <- x[,4]+0.5
colnames(x) <- c("Method A","Method B","Method C - long name","Method D")
nemenyi(x,conf.level=0.95,plottype="vline")




