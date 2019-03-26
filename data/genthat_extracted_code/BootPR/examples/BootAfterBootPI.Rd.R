library(BootPR)


### Name: BootAfterBootPI
### Title: Bootstrap-after-Bootstrap Prediction
### Aliases: BootAfterBootPI
### Keywords: ts

### ** Examples

data(IPdata)
BootAfterBootPI(IPdata,p=1,h=10,nboot=100,prob=c(0.05,0.95),type="const+trend")



