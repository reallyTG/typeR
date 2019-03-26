library(spdep)


### Name: lee.mc
### Title: Permutation test for Lee's L statistic
### Aliases: lee.mc
### Keywords: spatial

### ** Examples

data(boston, package="spData")
lw<-nb2listw(boston.soi)

x<-boston.c$CMEDV
y<-boston.c$CRIM

lee.mc(x, y, nsim=99, lw, zero.policy=TRUE, alternative="less")

#Test with missing values
x[1:5]<-NA
y[3:7]<-NA

lee.mc(x, y, nsim=99, lw, zero.policy=TRUE, alternative="less", 
   na.action=na.omit)




