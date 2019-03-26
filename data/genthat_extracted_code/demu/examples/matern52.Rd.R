library(demu)


### Name: matern52
### Title: Calculate the correlation matrix according to the Matern model
###   with nu=5/2.
### Aliases: matern52

### ** Examples

library(demu)

design=matrix(runif(10,0,1),ncol=2,nrow=5)
theta=rep(0.2,2)
l.d=makedistlist(design)
R=matern52(l.d,theta)$R
R



