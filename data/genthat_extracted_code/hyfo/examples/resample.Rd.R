library(hyfo)


### Name: resample
### Title: Resample your time series or ncdf files.
### Aliases: resample resample,data.frame-method resample,list-method

### ** Examples

# Daily to monthly
data(testdl)
TS <- testdl[[2]] # Get daily data
str(TS)
TS_new <- resample(TS, method = 'day2mon')

# Monthly to daily
TS <- data.frame(Date = seq(as.Date('1999-9-15'), length = 30, by = '1 month'), 
runif(30, 3, 10))
TS_new <- resample(TS, method = 'mon2day')

#' # First load ncdf file.
filePath <- system.file("extdata", "tnc.nc", package = "hyfo")
varname <- getNcdfVar(filePath)    
nc <- loadNcdf(filePath, varname)

nc_new <- resample(nc, 'day2mon')


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




