library(segmenTier)


### Name: segmentCluster.batch
### Title: Batch wrapper for 'segmentClusters'.
### Aliases: segmentCluster.batch

### ** Examples

# load example data, an RNA-seq time-series data from a short genomic
# region of budding yeast
data(primseg436)

# 1) Fourier-transform time series:
tset <- processTimeseries(ts=tsd, na2zero=TRUE, use.fft=TRUE,
                          dft.range=1:7, dc.trafo="ash", use.snr=TRUE)

# 2) cluster time-series several times into K=12 clusters:
cset <- clusterTimeseries(tset, K=c(12,12,12))

# 3) choose parameter ranges, here only E is varied 
vary <- setVarySettings(M=100, E=c(1,3), nui=3, S="icor", Mn=20)

# 4) ... segment ALL using the batch function:
## Not run: 
##D  ## NOTE: takes too long for CRAN example timing restrictions
##D segments <- segmentCluster.batch(cset=cset, varySettings=vary)
##D 
##D # 5) inspect results:
##D print(segments)
##D plotSegmentation(tset, cset, segments)
##D 
##D # 6) and get segment border table. Note that the table has
##D #    additional columns "ID" and "type", indicating the used parameters,
##D #    and "color" providing the color of the cluster the segment was
##D #    assigned to. This allows to track segments in the inspection plots.
##D sgtable <- segments$segments
## End(Not run)




