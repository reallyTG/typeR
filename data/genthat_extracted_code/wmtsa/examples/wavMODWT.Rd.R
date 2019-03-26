library(wmtsa)


### Name: wavMODWT
### Title: The maximal overlap discrete wavelet transform (MODWT)
### Aliases: wavMODWT
### Keywords: univar

### ** Examples

## calculate the MODWT of linear chirp 
linchirp <- make.signal("linchirp", n=1024)
result   <- wavMODWT(linchirp, wavelet="s8", n.levels=5, keep.series=TRUE)

## plot the transform shifted for approximate zero 
## phase alignment 
plot(wavShift(result))

## plot summary 
eda.plot(result)

## summarize the transform 
summary(result)



