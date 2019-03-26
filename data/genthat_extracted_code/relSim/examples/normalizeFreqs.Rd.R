library(relSim)


### Name: normalizeFreqs
### Title: Normalize frequencies to 1
### Aliases: normalizeFreqs

### ** Examples


data(fbiCaucs)

## induce an error
fbiCaucs$freqs[[1]] = rgamma(10,1,1)
checkFreqs(fbiCaucs)
fbiCaucs = normalizeFreqs(fbiCaucs)
checkFreqs(fbiCaucs)




