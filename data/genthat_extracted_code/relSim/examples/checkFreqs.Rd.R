library(relSim)


### Name: checkFreqs
### Title: Make sure that the frequencies are such
### Aliases: checkFreqs

### ** Examples


data(fbiCaucs)
checkFreqs(fbiCaucs)

## induce an error
fbiCaucs$freqs[[1]] = runif(10)
checkFreqs(fbiCaucs)




