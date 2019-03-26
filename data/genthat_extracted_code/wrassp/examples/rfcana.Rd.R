library(wrassp)


### Name: rfcana
### Title: rfcana
### Aliases: rfcana

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# perform linear prediction analysis
res <- rfcana(path2wav, toFile=FALSE)

# plot reflection coefficients
matplot(seq(0,numRecs.AsspDataObj(res) - 1) / rate.AsspDataObj(res) + 
          attr(res, 'startTime'), 
        res$rfc, 
        type='l', 
        xlab='time (s)', 
        ylab='reflection coefficient values')
        



