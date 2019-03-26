library(AER)


### Name: WeakInstrument
### Title: Artificial Weak Instrument Data
### Aliases: WeakInstrument
### Keywords: datasets

### ** Examples

data("WeakInstrument")
fm <- ivreg(y ~ x | z, data = WeakInstrument)
summary(fm)



