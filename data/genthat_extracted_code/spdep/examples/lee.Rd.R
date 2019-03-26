library(spdep)


### Name: lee
### Title: Compute Lee's statistic
### Aliases: lee
### Keywords: spatial

### ** Examples

data(boston, package="spData")
lw<-nb2listw(boston.soi)

x<-boston.c$CMEDV
y<-boston.c$CRIM
z<-boston.c$RAD

Lxy<-lee(x, y, lw, length(x), zero.policy=TRUE)
Lxz<-lee(x, z, lw, length(x), zero.policy=TRUE)




