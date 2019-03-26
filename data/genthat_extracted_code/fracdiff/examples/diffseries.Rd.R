library(fracdiff)


### Name: diffseries
### Title: Fractionally Differenciate Data
### Aliases: diffseries
### Keywords: ts

### ** Examples

memory.long <- fracdiff.sim(80, d = 0.3)
mGPH <- fdGPH(memory.long$series)
r <- diffseries(memory.long$series, d = mGPH$d)
#acf(r) # shouldn't show structure - ideally



