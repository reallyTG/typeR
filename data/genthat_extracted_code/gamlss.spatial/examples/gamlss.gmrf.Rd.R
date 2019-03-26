library(gamlss.spatial)


### Name: gamlss.gmrf
### Title: Gaussian Markov Random Field fitting within GAMLSS
### Aliases: gamlss.gmrf gmrf
### Keywords: regression spatial

### ** Examples

library(gamlss)
library(mgcv)
data(columb)
data(columb.polys)
vizinhos=polys2nb(columb.polys)
precisionC <- nb2prec(vizinhos,x=columb$district)
# MRFA
 m1<- gamlss(crime~ gmrf(district, polys=columb.polys, method="Q"), data=columb)
 m2<- gamlss(crime~ gmrf(district, polys=columb.polys, method="A"), data=columb)
AIC(m1,m2, k=0)
draw.polys(columb.polys, getSmo(m2), scheme="topo")



