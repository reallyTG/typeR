library(wrassp)


### Name: zcrana
### Title: zcrana
### Aliases: zcrana

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate zcr values
res <- zcrana(path2wav, toFile=FALSE)

# plot zcr values
plot(seq(0,numRecs.AsspDataObj(res) - 1) / rate.AsspDataObj(res) +
       attr(res, 'startTime'),
     res$zcr, 
     type='l', 
     xlab='time (s)', 
     ylab='ZCR values')




