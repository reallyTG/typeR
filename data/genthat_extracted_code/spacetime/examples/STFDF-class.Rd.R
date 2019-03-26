library(spacetime)


### Name: STFDF-class
### Title: Class "STFDF"
### Aliases: STFDF-class STF-class STFDF STF as.data.frame.STF [,STF-method
###   [,STFDF-method coerce,STFDF,xts-method coerce,STFDF,Spatial-method
###   plot,STF,missing-method plot,STFDF,missing-method
###   geometry,STFDF-method na.omit.STFDF rbind.STFDF as.zoo as.zoo.STFDF
### Keywords: classes

### ** Examples

sp = cbind(x = c(0,0,1), y = c(0,1,1))
row.names(sp) = paste("point", 1:nrow(sp), sep="")
library(sp)
sp = SpatialPoints(sp)
time = as.POSIXct("2010-08-05")+3600*(10:13)
m = c(10,20,30) # means for each of the 3 point locations
mydata = rnorm(length(sp)*length(time),mean=rep(m, 4))
IDs = paste("ID",1:length(mydata))
mydata = data.frame(values = signif(mydata,3), ID=IDs)
stfdf = STFDF(sp, time, mydata)
stfdf
stfdf[1:2,]
stfdf[,1:2]
stfdf[,,2]
stfdf[,,"values"]
stfdf[1,]
stfdf[,2]
as(stfdf[,,1], "xts")
as(stfdf[,,2], "xts")
# examples for [[, [[<-, $ and $<- 
stfdf[[1]]
stfdf[["values"]]
stfdf[["newVal"]] <- rnorm(12)
stfdf$ID
stfdf$ID = paste("OldIDs", 1:12, sep="")
stfdf$NewID = paste("NewIDs", 12:1, sep="")
stfdf
x = stfdf[stfdf[1:2,],] 
all.equal(x, stfdf[1:2,]) 
all.equal(stfdf, stfdf[stfdf,]) # converts character to factor...



