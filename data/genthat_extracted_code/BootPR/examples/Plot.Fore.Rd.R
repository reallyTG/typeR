library(BootPR)


### Name: Plot.Fore
### Title: Plotting point forecasts
### Aliases: Plot.Fore
### Keywords: ts

### ** Examples

data(IPdata)
BootF <- BootBC(IPdata,p=1,h=10,nboot=100,type="const+trend")
Plot.Fore(IPdata,BootF$forecast,start=1860,end=1988,frequency=1)



