library(BivRegBLS)


### Name: raw.plot
### Title: Raw plot for descriptive statistics
### Aliases: raw.plot
### Keywords: plot errors bars XY plot MD plot Bland-Altman

### ** Examples

library(BivRegBLS)
data(Aromatics)
# Calculate the descriptive statistics
res=desc.stat(data=Aromatics,xcol=3,ycol=4,IDcol="Type")
# Plot the mean or single measures (it is the same for unreplicated data)
raw.plot(data.plot=res,xname="HPLC",yname="GC MS",graph="XY.means")
raw.plot(data.plot=res,xname="HPLC",yname="GC MS",graph="XY.points")
# Plot with customized colours and type of points per type of samples
raw.plot(data.plot=res,xname="HPLC",yname="GC MS",graph="XY.points",pch.ID=c(19,5,8),col.ID=c(1,2))
raw.plot(data.plot=res,xname="HPLC",yname="GC MS",graph="MD.means")
raw.plot(data.plot=res,xname="HPLC",yname="GC MS",graph="MD.means",col.ID=c(1,2,4))
data(SBP)
# Calculate the descriptive statistics
res=desc.stat(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
# Different plots to show the measurement uncertainties
raw.plot(data.plot=res,xname="J",yname="S",graph="XY.means")
raw.plot(data.plot=res,xname="J",yname="S",graph="XY.points")
raw.plot(data.plot=res,xname="J",yname="S",graph="XY.bar.range")
raw.plot(data.plot=res,xname="J",yname="S",graph="XY.bar.SD")
raw.plot(data.plot=res,xname="J",yname="S",graph="XY.bar.SEM")
raw.plot(data.plot=res,xname="J",yname="S",graph="MD.means")



