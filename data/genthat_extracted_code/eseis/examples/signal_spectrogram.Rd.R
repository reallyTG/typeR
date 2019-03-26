library(eseis)


### Name: signal_spectrogram
### Title: Calculate spectrograms (power spectral density estimates) from
###   time series.
### Aliases: signal_spectrogram
### Keywords: eseis

### ** Examples


## load example data set
data("earthquake")

## calculate and plot PSD straight away
P <- signal_spectrogram(data = s$BHZ, 
                               time = t, 
                               dt = 1 / 200, 
                               plot = TRUE)

## calculate and plot PSD with defined window sizes and the Welch method
P <- signal_spectrogram(data = s$BHZ, 
                               time = t, 
                               dt = 1 / 200, 
                               window = 5, 
                               overlap = 0.9, 
                               window_sub = 3, 
                               overlap_sub = 0.9, 
                               Welch = TRUE,
                               plot = TRUE)
                               
## calculate and plot PSD with even smaller window sizes, the Welch
## method and using multitapers, uncomment to use.
# P <- signal_spectrogram(data = s$BHZ, 
#                                time = t, 
#                                dt = 1 / 200, 
#                                window = 2, 
#                                overlap = 0.9, 
#                                window_sub = 1, 
#                                overlap_sub = 0.9, 
#                                Welch = TRUE,
#                                multitaper = TRUE,
#                                plot = TRUE)
                      



