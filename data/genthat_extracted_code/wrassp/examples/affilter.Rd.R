library(wrassp)


### Name: affilter
### Title: affilter
### Aliases: affilter

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# band-pass filter signal between 4000 and 5000 Hz
res <- affilter(path2wav, highPass=4000, lowPass=5000, toFile=FALSE)

# plot samples
# (only plot every 10th element to accelerate plotting)
plot(seq(0,numRecs.AsspDataObj(res) - 1, 10) / rate.AsspDataObj(res), 
     res$audio[c(TRUE, rep(FALSE,9))], 
     type='l', 
     xlab='time (s)', 
     ylab='Audio samples')
     



