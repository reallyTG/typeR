library(wmtsa)


### Name: wavDWPT
### Title: The discrete wavelet packet transform (DWPT)
### Aliases: wavDWPT
### Keywords: univar

### ** Examples

## calculate the DWPT of sunspots series out to 3 
## levels using Daubechies least asymmetric 
## 8-tap filter set 
z <- wavDWPT(sunspots, wavelet="s8", n.levels=3)

## plot the transform 
plot(z)

## summarize the transform 
summary(z)



