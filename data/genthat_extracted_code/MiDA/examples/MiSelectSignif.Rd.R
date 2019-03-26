library(MiDA)


### Name: MiSelectSignif
### Title: Select biological markers with high fold change and
###   classification importance
### Aliases: MiSelectSignif

### ** Examples

probes<-paste("probe", 1:50, sep="") #probes
mean1<-rnorm(50, mean=0, sd=1) #means
mean2<-rnorm(50, mean=5, sd=1)
infl<-c(1:50) # influence
stat.val<-rep(c(0.05, 0.04), c(20, 30))
Result<-MiSelectSignif(probes, mean1, mean2, FC.method="absolute", infl, stat.val,
                      tresh.FC=0.75, tresh.infl=0.75, tresh.stat=0.05)
Result[1:5,]




