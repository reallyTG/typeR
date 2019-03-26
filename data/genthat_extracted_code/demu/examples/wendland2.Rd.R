library(demu)


### Name: wendland2
### Title: Calculate the correlation matrix according to the Wendland2
###   model.
### Aliases: wendland2

### ** Examples

library(demu)

design=matrix(runif(10,0,1),ncol=2,nrow=5)
theta=rep(0.3,2)
l.d=makedistlist(design)
R=wendland2(l.d,theta)$R
R



