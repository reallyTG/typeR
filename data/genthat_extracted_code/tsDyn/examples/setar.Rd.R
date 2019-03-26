library(tsDyn)


### Name: SETAR
### Title: Self Threshold Autoregressive model
### Aliases: SETAR setar summary.setar
### Keywords: ts

### ** Examples

#fit a SETAR model, with threshold as suggested in Tong(1990, p 377)
mod.setar <- setar(log10(lynx), m=2, thDelay=1, th=3.25)
mod.setar
summary(mod.setar)

## example in Tsay (2005)
data(m.unrate)
setar(diff(m.unrate), ML=c(2,3,4,12), MH=c(2,4,12), th=0.1, include="none")



