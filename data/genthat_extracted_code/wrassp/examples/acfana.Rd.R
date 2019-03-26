library(wrassp)


### Name: acfana
### Title: acfana
### Aliases: acfana

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate short-term autocorrelation
res <- acfana(path2wav, toFile=FALSE)

# plot short-term autocorrelation values
matplot(seq(0,numRecs.AsspDataObj(res) - 1) / rate.AsspDataObj(res) + 
        attr(res, 'startTime'), 
        res$acf, 
        type='l', 
        xlab='time (s)', 
        ylab='short-term autocorrelation values')
        



