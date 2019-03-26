library(IRISSeismic)


### Name: IRISSeismic-package
### Title: Classes and methods for seismic data analysis
### Aliases: IRISSeismic-package IRISSeismic

### ** Examples

# Open a connection to IRIS DMC webservices
iris <- new("IrisClient", debug=TRUE)

starttime <- as.POSIXct("2010-02-27 06:45:00", tz="GMT")
endtime <- as.POSIXct("2010-02-27 07:45:00", tz="GMT")

# Get the seismic data
st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)

# Extract the first trace, display the metadata and plot it
tr1 <- st@traces[[1]]
show(tr1@stats)
plot(tr1)



