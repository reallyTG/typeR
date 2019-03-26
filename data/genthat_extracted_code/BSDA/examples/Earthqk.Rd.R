library(BSDA)


### Name: Earthqk
### Title: One hundred year record of worldwide seismic activity(1770-1869)
### Aliases: Earthqk
### Keywords: datasets

### ** Examples


EDA(Earthqk$severity)
t.test(Earthqk$severity, mu = 100, alternative = "greater")




