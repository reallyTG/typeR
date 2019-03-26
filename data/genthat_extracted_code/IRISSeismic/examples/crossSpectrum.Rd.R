library(IRISSeismic)


### Name: crossSpectrum
### Title: Cross-Spectral Analaysis
### Aliases: crossSpectrum
### Keywords: spectra

### ** Examples

#\dontrun{
# Create a new IrisClient
iris <- new("IrisClient")

# Get seismic data
starttime <- as.POSIXct("2011-05-01", tz="GMT")
endtime <- starttime + 3600

st1 <- getDataselect(iris,"CI","PASC","00","BHZ",starttime,endtime)
st2 <- getDataselect(iris,"CI","PASC","10","BHZ",starttime,endtime)
tr1 <- st1@traces[[1]]
tr2 <- st2@traces[[1]]

# Both traces have a sampling rate of 40 Hz
sampling_rate <- tr1@stats@sampling_rate

ts1 <- ts(tr1@data,frequency=sampling_rate)
ts2 <- ts(tr2@data,frequency=sampling_rate)

# Calculate the cross spectrum
DF <- crossSpectrum(ts.union(ts1,ts2),spans=c(3,5,7,9))

# Calculate the transfer function
transferFunction <- DF$Pxy / DF$Pxx
transferAmp <- Mod(transferFunction)
transferPhase <- pracma::mod(Arg(transferFunction) * 180/pi,360)

# 2 rows
layout(matrix(seq(2)))

# Plot
plot(1/DF$freq,transferAmp,type='l',log='x',
     xlab="Period (sec)",
     main="Transfer Function Amplitude")

plot(1/DF$freq,transferPhase,type='l',log='x',
     xlab="Period (sec)", ylab="degrees",
     main="Transfer Function Phase")

# Restore default layout
layout(1)
#}



