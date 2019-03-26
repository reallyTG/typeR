library(wmtsa)


### Name: wavDaubechies
### Title: Daubechies wavelet and scaling filters
### Aliases: wavDaubechies plot.wavDaubechies print.wavDaubechies
### Keywords: univar

### ** Examples

## obtain Daubechies least asymmetric 8-tap filter 
## set 
filters <- wavDaubechies("s8", normalize=TRUE)

## plot the impulse responses 
plot(filters, type="time")

## plot the gain function 
plot(filters, type="gain")



