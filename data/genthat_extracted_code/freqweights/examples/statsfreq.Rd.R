library(freqweights)


### Name: statsfreq
### Title: Descriptive statistics of a frequency table.
### Aliases: statsfreq meanfreq quantilefreq covfreq corfreq sdfreq
###   meanfreq .meanfreq quantilefreq .quantilefreq covfreq .covfreq sdfreq
###   .sdfreq scalefreq .scalefreq corfreq .corfreq
### Keywords: univar

### ** Examples

if(require(hflights)) {
  meanfreq(hflights[,c("ArrDelay","DepDelay")])
  sdfreq(hflights[,c("ArrDelay","DepDelay")])
  corfreq(hflights[,c("ArrDelay","DepDelay")])
}

tfq <- tablefreq(iris$Sepal.Length)
tfq

meanfreq(iris$Sepal.Length)
meanfreq(tfq,freq="freq")
.meanfreq(tfq)

dat <- iris[,1:4]
quantilefreq(dat)
corfreq(dat)

tfq <- tablefreq(dat)
.meanfreq(tfq)
.quantilefreq(tfq)
.corfreq(tfq)

## dplyr integration
library(dplyr)
tfq  %>% 
  summarise( mean = .meanfreq(cbind(Sepal.Length,freq)),
            sd = .sdfreq(cbind(Sepal.Length,freq)))

tfq <- tablefreq(iris)
tfq %>% group_by(Species) %>% 
  summarise( mean = .meanfreq(cbind(Sepal.Length,freq)),
            sd = .sdfreq(cbind(Sepal.Length,freq)))



