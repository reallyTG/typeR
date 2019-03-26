library(TSclust)


### Name: diss.PRED
### Title: Dissimilarity Measure Based on Nonparametric Forecast
### Aliases: diss.PRED
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- (rnorm(100))
x <- x + abs(min(x)) + 1 #shift to produce values greater than 0, for a correct logarithm transform
y <- (rnorm(100))
z <- sin(seq(0, pi, length.out=100))
## Compute the distance and check for coherent results
diss.PRED(x, y, h=6, logarithm.x=FALSE, logarithm.y=FALSE, differences.x=1, differences.y=0)
#create a dist object for its use with clustering functions like pam or hclust
diss( rbind(x,y,z), METHOD="PRED", h=3, B=200,
 logarithms=c(TRUE,FALSE, FALSE), differences=c(1,1,2) )




