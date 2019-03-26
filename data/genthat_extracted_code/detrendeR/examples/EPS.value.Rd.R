library(detrendeR)


### Name: EPS.value
### Title: Computes general statistics on ring-width series.
### Aliases: EPS.value

### ** Examples


data(co021, package="dplR")

years<-as.integer(rownames(co021))
co021.subset<-(subset(co021, subset=years>=1900 & years<=1950))
co021.subset<-co021.subset[,-c(28,30,31)] ## to remove the following series "645232","646107" and "646118"

EPS.value(co021.subset, stc=c(0,8,0))




