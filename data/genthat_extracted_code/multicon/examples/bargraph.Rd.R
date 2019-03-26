library(multicon)


### Name: bargraph
### Title: Bar Graph
### Aliases: bargraph
### Keywords: bargraph error bars

### ** Examples

T1=rnorm(100,mean=5,sd=1)
times=rep(seq(1,5,1),20)
bargraph(DV=T1,grp=times,barFUN=mean,errFUN="ci",conf=.95,ylim=c(0,6))



