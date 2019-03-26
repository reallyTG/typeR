library(rwavelet)


### Name: aconv
### Title: Convolution Tool for Two-Scale Transform.
### Aliases: aconv

### ** Examples

qmf <- MakeONFilter('Haar')
x <- MakeSignal('HeaviSine',2^3)
aconv(qmf,x)



