library(rwavelet)


### Name: DownDyadHi
### Title: Hi-Pass Downsampling operator (periodized)
### Aliases: DownDyadHi

### ** Examples

qmf <- MakeONFilter('Haar')
x <- MakeSignal('HeaviSine',2^3)
DownDyadHi(x, qmf)



