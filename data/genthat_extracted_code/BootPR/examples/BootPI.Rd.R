library(BootPR)


### Name: BootPI
### Title: Bootstrap prediction intevals and point forecasts with no
###   bias-correction
### Aliases: BootPI
### Keywords: ts

### ** Examples

data(IPdata)
BootPI(IPdata,p=1,h=10,nboot=100,prob=c(0.05,0.95),type="const+trend")



