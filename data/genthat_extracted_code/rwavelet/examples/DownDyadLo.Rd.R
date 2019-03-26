library(rwavelet)


### Name: DownDyadLo
### Title: Lo-Pass Downsampling operator (periodized)
### Aliases: DownDyadLo

### ** Examples

qmf <- MakeONFilter('Haar')
x <- MakeSignal('HeaviSine',2^3)
DownDyadLo(x,qmf)



