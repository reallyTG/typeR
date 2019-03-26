library(demu)


### Name: matern32
### Title: Calculate the correlation matrix according to the Matern model
###   with nu=3/2.
### Aliases: matern32

### ** Examples

library(demu)

design=matrix(runif(10,0,1),ncol=2,nrow=5)
theta=rep(0.2,2)
l.d=makedistlist(design)
R=matern32(l.d,theta)$R
R



