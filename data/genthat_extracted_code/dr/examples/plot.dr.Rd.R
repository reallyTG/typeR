library(dr)


### Name: plot.dr
### Title: Basic plot of a dr object
### Aliases: plot.dr
### Keywords: regression

### ** Examples

data(ais)
# default fitting method is "sir"
s0 <- dr(LBM~log(SSF)+log(Wt)+log(Hg)+log(Ht)+log(WCC)+log(RCC)+
  log(Hc)+log(Ferr),data=ais)
plot(s0)
plot(s0,mark.by.y=TRUE)
 


