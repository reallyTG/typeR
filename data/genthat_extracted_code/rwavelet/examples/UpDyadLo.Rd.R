library(rwavelet)


### Name: UpDyadLo
### Title: Lo-Pass Upsampling operator; periodized
### Aliases: UpDyadLo

### ** Examples

qmf <- MakeONFilter('Haar')
x <- MakeSignal('HeaviSine',2^3)
UpDyadLo(x,qmf)



