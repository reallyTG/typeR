library(segmenTier)


### Name: clusterTimeseries
### Title: Cluster a processed time-series with k-means.
### Aliases: clusterTimeseries

### ** Examples

data(primseg436)
## Discrete Fourier Transform of the time-series, 
## see ?processTimeseries for details
tset <- processTimeseries(ts=tsd, na2zero=TRUE, use.fft=TRUE,
                          dft.range=1:7,  dc.trafo="ash", use.snr=TRUE)
## ... and cluster the transformed time-series
cset <- clusterTimeseries(tset)
## plot methods for both returned objects allow aligned plots
par(mfcol=c(3,1))
plot(tset)
plot(cset)



