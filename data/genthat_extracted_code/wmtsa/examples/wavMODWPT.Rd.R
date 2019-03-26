library(wmtsa)


### Name: wavMODWPT
### Title: The maximal overlap discrete wavelet packet transform (MODWPT)
### Aliases: wavMODWPT
### Keywords: univar

### ** Examples

## calculate the MODWPT of sunspots series out to 
## 3 levels using Daubechies least asymmetric 
## 8-tap filter set 
z <- wavMODWPT(sunspots, wavelet="s8", n.levels=3)

## plot the transform 
plot(z)

## summarize the transform 
summary(z)



