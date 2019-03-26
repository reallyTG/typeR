library(wmtsa)


### Name: wavMRD
### Title: Calculate the detail sequences for wavelet transform crystals
### Aliases: wavMRD [.wavMRD [<-.wavMRD [[.wavMRD as.matrix.wavMRD
###   boxplot.wavMRD crystal.names.wavMRD dotchart.wavMRD eda.plot.wavMRD
###   plot.wavMRD print.wavMRD print.summary.wavMRD reconstruct.wavMRD
###   wavStackPlot.wavMRD summary.wavMRD
### Keywords: univar

### ** Examples

## calculate various wavelet transforms of the 
## first difference of a linear chirp sequence 
x <- make.signal("linchirp", n=1024)
x.dwt <- wavDWT(x, n.levels = 3)
x.modwt <- wavMODWT(x, n.levels = 3)

## calculate the wavelet details for all crystals 
## of the DWT and MODWT 
wavMRD(x.dwt)
wavMRD(x.modwt)

## plot the wavelet details for levels 1 and 3 of 
## the MODWT 
plot(wavMRD(x.modwt, level = c(1,3)))

## plot the wavelet details for all levels of the 
## MODWT of a linear chirp. 
plot(wavMRD(x.modwt))



