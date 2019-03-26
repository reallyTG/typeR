library(spacetime)


### Name: unstack
### Title: write STFDF to table forms
### Aliases: unstack.STFDF as.data.frame.STFDF
### Keywords: manip

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
as.data.frame(stfdf, row.names = IDs)
unstack(stfdf)
t(unstack(stfdf))
unstack(stfdf, which = 2)



