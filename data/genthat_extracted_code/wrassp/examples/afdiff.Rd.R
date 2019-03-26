library(wrassp)


### Name: afdiff
### Title: afdiff
### Aliases: afdiff

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# compute the first forward difference of the signal
res <- afdiff(path2wav, toFile=FALSE)

# plot samples
# (only plot every 10th element to accelerate plotting)
plot(seq(0,numRecs.AsspDataObj(res) - 1, 10) / rate.AsspDataObj(res), 
     res$audio[c(TRUE, rep(FALSE,9))], 
     type='l', 
     xlab='time (s)', 
     ylab='Audio samples')
     



