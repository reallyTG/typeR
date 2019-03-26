library(spacetime)


### Name: STIDF-class
### Title: Class "STIDF"
### Aliases: STIDF-class STI-class STIDF STI as.data.frame.STIDF
###   as.data.frame.STI [,STIDF-method [,STI-method geometry,STIDF-method
###   geometry,STI-method coerce,STIDF,STSDF-method plot,STI,missing-method
###   rbind.STIDF
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
stidf = as(STFDF(sp, time, mydata), "STIDF")
stidf[1:2,]
all.equal(stidf, stidf[stidf,])



