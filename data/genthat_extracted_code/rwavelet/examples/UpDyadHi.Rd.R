library(rwavelet)


### Name: UpDyadHi
### Title: Hi-Pass Upsampling operator; periodized
### Aliases: UpDyadHi

### ** Examples

qmf <- MakeONFilter('Haar')
x <- MakeSignal('HeaviSine',2^3)
UpDyadHi(x,qmf)



