library(eseis)


### Name: plot_ppsd
### Title: Plot a probabilistic power spectral density estimate (PPSD)
### Aliases: plot_ppsd
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## deconvolve data set
r <- signal_deconvolve(data = rockfall_eseis)

## calculate PSD
p <- signal_spectrogram(data = r)

## plot PPSD
plot_ppsd(data = p$PSD)

## plot PPSD with lower resolution, more smoothing and other colour
ppsd_color <- colorRampPalette(c("white", "black", "red"))

plot_ppsd(data = p$PSD, 
          res = c(200, 200), 
          n = c(15, 20), 
          col = ppsd_color(200))




