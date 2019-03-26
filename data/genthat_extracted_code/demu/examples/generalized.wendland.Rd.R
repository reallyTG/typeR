library(demu)


### Name: generalized.wendland
### Title: Calculate the correlation matrix according to the generalized
###   Wendland model.
### Aliases: generalized.wendland

### ** Examples

library(demu)

design=matrix(runif(10,0,1),ncol=2,nrow=5)
theta=0.3
kap=3
l.d=makedistlist(design)
R=generalized.wendland(l.d,theta,kap)$R
R



