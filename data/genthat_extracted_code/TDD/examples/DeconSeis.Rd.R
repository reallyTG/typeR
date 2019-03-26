library(TDD)


### Name: DeconSeis
### Title: Deconvolve discrete instrument response from many traces
### Aliases: DeconSeis
### Keywords: misc

### ** Examples

data(COLOC)
swig(COLOC)
L = GetDPZ(c(4, 14), c(0.01, 0.01)) # get responses for 3T and 40T-1s
inst = c(1,1,1,2,2,2) # deconvolve 3T response from channel 1-3,
                      # 40T-1 response from channel 4-6
D = DeconSeis(COLOC, inst, L)
swig(D)



