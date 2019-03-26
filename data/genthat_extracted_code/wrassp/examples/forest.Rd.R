library(wrassp)


### Name: forest
### Title: forest
### Aliases: forest

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate formant values
res <- forest(path2wav, toFile=FALSE)

# plot formant values
matplot(seq(0,numRecs.AsspDataObj(res) - 1) / rate.AsspDataObj(res) + 
          attr(res, 'startTime'), 
        res$fm, 
        type='l', 
        xlab='time (s)', 
        ylab='Formant frequency (Hz)')




