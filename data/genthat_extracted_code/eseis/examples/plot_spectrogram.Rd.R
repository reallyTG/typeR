library(eseis)


### Name: plot_spectrogram
### Title: Plot spectrograms (power spectral density estimates)
### Aliases: plot_spectrogram
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## deconvolve signal
rockfall <- signal_deconvolve(data = rockfall_eseis)

## calculate spectrogram
PSD <- signal_spectrogram(data = rockfall)

## plot spectrogram
plot_spectrogram(data = PSD)

## plot spectrogram with legend and labels in rainbow colours
plot_spectrogram(data = PSD, 
                 xlab = "Time (min)", 
                 ylab = "f (Hz)", 
                 main = "Power spectral density estimate", 
                 legend = TRUE, 
                 zlim = c(-220, -70),
                 col = "rainbow")

                     



