library(BootPR)


### Name: Plot.PI
### Title: Plotting prediction intervals and point forecasts
### Aliases: Plot.PI
### Keywords: ts

### ** Examples

data(IPdata)
PI <- ShamanStine.PI(IPdata,p=1,h=10,nboot=100,prob=c(0.025,0.05,0.95,0.975),type="const+trend",0)
Plot.PI(IPdata,PI$forecast,PI$PI,start=1860,end=1988,frequency=1)



