library(wrassp)


### Name: rmsana
### Title: rmsana
### Aliases: rmsana

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate rms values
res <- rmsana(path2wav, toFile=FALSE)

# plot rms values
plot(seq(0,numRecs.AsspDataObj(res) - 1) / rate.AsspDataObj(res) +
       attr(res, 'startTime'),
     res$rms, 
     type='l', 
     xlab='time (s)', 
     ylab='RMS energy (dB)')




