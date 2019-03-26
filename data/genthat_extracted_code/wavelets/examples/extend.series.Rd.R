library(wavelets)


### Name: extend.series
### Title: Extend a Time Series
### Aliases: extend.series
### Keywords: ts

### ** Examples

# obtain the two series listed in Percival and Walden (2000), page 42
X1 <- c(.2,-.4,-.6,-.5,-.8,-.4,-.9,0,-.2,.1,-.1,.1,.7,.9,0,.3)
X2 <- c(.2,-.4,-.6,-.5,-.8,-.4,-.9,0,-.2,.1,-.1,.1,-.7,.9,0,.3)

# combine them and extend using reflection method
newX <- cbind(X1,X2)
newX.ext1 <- extend.series(newX, length="arbitrary", n=64)
plot.ts(newX.ext1)

# apply another extension method
newX.ext2 <- extend.series(newX, method="reflection.inverse",
                           length="powerof2", j=6)
plot.ts(newX.ext2) 



