library(FIACH)


### Name: lowBasis
### Title: Low pass filter basis set
### Aliases: lowBasis

### ** Examples


## 300 scans, 10 second cutoff, tr=2.16 seconds
lb<-lowBasis(300,10,2.16)
dim(lb)
plot.ts(lb[,1:10])




