library(wmtsa)


### Name: wavFDPBlock
### Title: Block-dependent estimation of fractionally differenced (FD)
###   model parameters
### Aliases: wavFDPBlock
### Keywords: models

### ** Examples

## perform a block-averaged MLE of FD parameters 
## for an FD(0.45, 1) realization over levels 1 
## through 6 using a stationary-nonstationary 
## FD model and Daubechies least asymmetric 
## 8-tap filters 
wavFDPBlock(fdp045, levels=1:6, wavelet="s8", est="mle", boundary="nonstationary")



