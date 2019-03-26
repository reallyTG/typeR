library(fda.usc)


### Name: fdata.cen
### Title: Functional data centred (subtract the mean of each
###   discretization point)
### Aliases: fdata.cen
### Keywords: manip

### ** Examples


data(phoneme)
mlearn<-phoneme[["learn"]][13:15,]
fdata.c=fdata.cen(mlearn)$Xcen
par(mfrow=c(1,2))
plot.fdata(mlearn,type="l")
plot.fdata(fdata.c,type="l")



