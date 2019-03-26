library(IRISSeismic)


### Name: DDT
### Title: Apply demean, detrend, cosine taper
### Aliases: DDT DDT,Trace,logical,logical,numeric-method
###   DDT,Trace,missing,missing,missing-method
### Keywords: methods

### ** Examples

# Open a connection to IRIS DMC webservices
iris <- new("IrisClient")

# P-wave onset for a big quake
starttime <- as.POSIXct("2010-02-27 06:30:00", tz="GMT")
endtime <- as.POSIXct("2010-02-27 07:00:00", tz="GMT")
st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)

tr <- st@traces[[1]]
trClean <- DDT(tr,TRUE,TRUE,0.1)
layout(matrix(seq(2)))
plot(tr)
abline(h=0,col='gray60')
mtext("Raw",side=3,line=-2,adj=0.05,col='red')
plot(trClean)
abline(h=0,col='gray60')
mtext("Demean - Detrend - Cosine Taper",line=-2,side=3,adj=0.05,col='red')

# Restore default layout
layout(1)



