library(provenance)


### Name: subset
### Title: Get a subset of distributional data
### Aliases: subset subset.distributional subset.compositional
###   subset.counts

### ** Examples

data(Namib)
coast <- c("N1","N2","T8","T13","N12","N13")
ZTRcoast <- subset(Namib$HM,select=coast,components=c('gt','cpx','ep'))
DZcoast <- subset(Namib$DZ,select=coast)
summaryplot(ZTRcoast,KDEs(DZcoast),ncol=2)



