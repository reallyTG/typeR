library(spacetime)


### Name: STSDF-class
### Title: Class "STSDF"
### Aliases: STSDF-class STS-class STSDF STS as.data.frame.STSDF
###   as.data.frame.STS [,STS-method [,STSDF-method
###   coerce,STSDF,STFDF-method coerce,STSDF,STIDF-method
###   geometry,STSDF-method plot,STS,missing-method
###   plot,STSDF,missing-method rbind.STSDF
### Keywords: classes

### ** Examples

sp = cbind(x = c(0,0,1), y = c(0,1,1))
row.names(sp) = paste("point", 1:nrow(sp), sep="")
library(sp)
sp = SpatialPoints(sp)
library(xts)
time = xts(1:4, as.POSIXct("2010-08-05")+3600*(10:13))
m = c(10,20,30) # means for each of the 3 point locations
mydata = rnorm(length(sp)*length(time),mean=rep(m, 4))
IDs = paste("ID",1:length(mydata))
mydata = data.frame(values = signif(mydata,3), ID=IDs)
stfdf = STFDF(sp, time, mydata)
stfdf
stsdf = as(stfdf, "STSDF")
stsdf[1:2,]
stsdf[,1:2]
stsdf[,,2]
stsdf[,,"values"]
stsdf[1,]
stsdf[,2]
# examples for [[, [[<-, $ and $<- 
stsdf[[1]]
stsdf[["values"]]
stsdf[["newVal"]] <- rnorm(12)
stsdf$ID
stsdf$ID = paste("OldIDs", 1:12, sep="")
stsdf$NewID = paste("NewIDs", 12:1, sep="")
stsdf
x = stsdf[stsdf,]
x = stsdf[stsdf[1:2,],]
all.equal(x, stsdf[1:2,])



