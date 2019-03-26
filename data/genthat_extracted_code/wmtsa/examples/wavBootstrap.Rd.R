library(wmtsa)


### Name: wavBootstrap
### Title: Adaptive wavelet-based bootstrapping
### Aliases: wavBootstrap
### Keywords: datagen

### ** Examples

## wavestrap the sunspots series 
x <- as.numeric(sunspots)
z <- wavBootstrap(x, n.realization=1)

ifultools::stackPlot(x=seq(along=sunspots),
y=data.frame(x, z, abs(z)),
ylab=list(text=c("sunspots","wavestrap","|wavestrap|")))

title("Wavelet-based bootstrapping of sunspots series", cex=0.7)



