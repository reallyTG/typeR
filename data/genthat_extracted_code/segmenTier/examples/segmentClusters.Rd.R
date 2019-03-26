library(segmenTier)


### Name: segmentClusters
### Title: Run the 'segmenTier' algorithm.
### Aliases: segmentClusters

### ** Examples

# load example data, an RNA-seq time-series data from a short genomic region
# of budding yeast
data(primseg436)

# 1) Fourier-transform time series:
## NOTE: reducing official example data set to stay within 
## CRAN example timing restrictions with segmentation below
tset <- processTimeseries(ts=tsd[2500:6500,], na2zero=TRUE, use.fft=TRUE,
                          dft.range=1:7, dc.trafo="ash", use.snr=TRUE)

# 2) cluster time-series into K=12 clusters:
cset <- clusterTimeseries(tset, K=12)

# 3) ... segment it; this takes a few seconds:
segments <- segmentClusters(seq=cset, M=100, E=2, nui=3, S="icor")

# 4) inspect results:
print(segments)
plotSegmentation(tset, cset, segments, cex=.5, lwd=3)

# 5) and get segment border table for further processing:
sgtable <- segments$segments




