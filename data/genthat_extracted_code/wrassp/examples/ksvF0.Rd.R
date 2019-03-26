library(wrassp)


### Name: ksvF0
### Title: ksvF0
### Aliases: ksvF0 f0ana f0_ksv

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate fundamental frequency contour
res <- ksvF0(path2wav, toFile=FALSE)

# plot the fundamental frequency contour
plot(seq(0,numRecs.AsspDataObj(res) - 1) / rate.AsspDataObj(res) +
       attr(res, 'startTime'),
     res$F0, 
     type='l', 
     xlab='time (s)', 
     ylab='F0 frequency (Hz)')
     



