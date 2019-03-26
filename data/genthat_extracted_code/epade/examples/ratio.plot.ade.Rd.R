library(epade)


### Name: ratio.plot.ade
### Title: Ratio plot
### Aliases: ratio.plot.ade
### Keywords: CI

### ** Examples

vnames<-c('Value 1', 'Value 2', 'Value 3', 'Value 4')
x<-abs(rnorm(4))
M1<-cbind(x, x-(x/2), x+(x/2))
x<-abs(rnorm(4))
M2<-cbind(x, x-(x/2), x+(x/2))
x<-abs(rnorm(4))
M3<-cbind(x, x-(x/2), x+(x/2))
ratio.plot.ade(list(M1, M2, M3), vnames=vnames, wall=3,
legenlab=c('group 1', 'group 2', 'group 3'))



