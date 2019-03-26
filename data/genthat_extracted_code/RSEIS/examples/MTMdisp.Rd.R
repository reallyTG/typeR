library(RSEIS)


### Name: MTMdisp
### Title: MTMdisp
### Aliases: MTMdisp
### Keywords: hplot

### ** Examples

data(CE1)
xvel <- list(y=CE1$y[CE1$x>5.443754 & CE1$x<5.615951], dt=CE1$dt)

len2 <- next2(length(xvel$y))
Spec <- MTMdisp(xvel, f1=.01, f2=25, len2=len2, PLOT=FALSE )




