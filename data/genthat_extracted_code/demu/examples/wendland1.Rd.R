library(demu)


### Name: wendland1
### Title: Calculate the correlation matrix according to the Wendland1
###   model.
### Aliases: wendland1

### ** Examples

library(demu)

design=matrix(runif(10,0,1),ncol=2,nrow=5)
theta=rep(0.3,2)
l.d=makedistlist(design)
R=wendland1(l.d,theta)$R
R



