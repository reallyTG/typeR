library(asus)


### Name: asus.cuts
### Title: Risk of asus with pre-defined grouping thresholds
### Aliases: asus.cuts

### ** Examples

library(asus)
set.seed(42)
d<-rnorm(10)
v.d<- rep(1,10)
set.seed(42)
s<-rnorm(10)
out<-asus.cuts(d,v.d,s,c(0.1,0.5,1))




