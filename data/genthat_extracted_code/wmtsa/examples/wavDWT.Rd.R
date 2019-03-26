library(wmtsa)


### Name: wavDWT
### Title: The discrete wavelet transform (DWT)
### Aliases: wavDWT
### Keywords: univar

### ** Examples

## calculate the DWT of linear chirp 
linchirp <- make.signal("linchirp", n=1024)
result   <- wavDWT(linchirp, wavelet="s8", n.levels=5, keep.series=TRUE)

## plot the transform shifted for approximate zero 
## phase alignment 
plot(wavShift(result))

## plot summary 
eda.plot(result)

## summarize the transform 
summary(result)



