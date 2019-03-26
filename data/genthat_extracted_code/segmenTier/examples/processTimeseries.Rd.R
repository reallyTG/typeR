library(segmenTier)


### Name: processTimeseries
### Title: Process a time-series for clustering and segmentation.
### Aliases: processTimeseries

### ** Examples

data(primseg436)
## The input data is a matrix with time points in columns
## and a 1D order, here 7624 genome positions, is reflected in rows,
## if the time-series should be segmented.
nrow(tsd)
## Time-series processing prepares the data for clustering,
## the example data is periodic, and we will cluster its Discrete Fourier
## Transform (DFT) rather then the original data. Specifically we will
## only use components 1 to 7 of the DFT (dft.range) and also apply
## a signal/noise ratio normalization, where each component is
## divided by the mean of all other components. To de-emphasize
## total levels the first component (DC for "direct current") of the
## DFT will be separately arcsinh transformed. This peculiar combination
## proofed best for our data:
tset <- processTimeseries(ts=tsd, na2zero=TRUE, use.fft=TRUE,
                          dft.range=1:7, dc.trafo="ash", use.snr=TRUE)
## a plot method exists for the returned time-series class:
par(mfcol=c(2,1))
plot(tset)



