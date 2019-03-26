library(wrassp)


### Name: mhsF0
### Title: mhsF0
### Aliases: mhsF0 mhspitch f0_mhs

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate fundamental frequency contour
res <- mhsF0(path2wav, toFile=FALSE)

# plot fundamental frequency contour
plot(seq(0,numRecs.AsspDataObj(res) - 1) / rate.AsspDataObj(res) +
       attr(res, 'startTime'),
     res$pitch, 
     type='l', 
     xlab='time (s)', 
     ylab='F0 frequency (Hz)')




