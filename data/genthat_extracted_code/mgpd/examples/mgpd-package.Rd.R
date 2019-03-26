library(mgpd)


### Name: mgpd-package
### Title: mgpd: Functions for multivariate generalized Pareto distribution
###   (MGPD of Type II)
### Aliases: mgpd-package mgpd
### Keywords: dbgpd, dtgpd

### ** Examples

x=y=seq(-2,6,0.05)
z1=outer(x,y,pbgpd,model="log")
z2=outer(x,y,pbgpd,model="neglog")
image(z1-z2)



