library(wmtsa)


### Name: wavGain
### Title: The gain functions for Daubechies wavelet and scaling filters
### Aliases: wavGain plot.wavGain print.wavGain
### Keywords: univar

### ** Examples

## approximate the gain functions for the 
## normalized Daubechies least asymmetric 
## 20-tap filters for levels 1,...,5 using a 
## 1024 Fourier frequencies 
result <- wavGain(wavelet="s20", n.levels=5,
    norm=TRUE)

## plot the results 
plot(result)



