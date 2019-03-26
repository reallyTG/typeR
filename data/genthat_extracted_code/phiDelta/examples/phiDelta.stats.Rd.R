library(phiDelta)


### Name: phiDelta.stats
### Title: Phi delta statistics from dataframe
### Aliases: phiDelta.stats

### ** Examples

x <- climate_data
phiDelta <- phiDelta.stats(x[,-1],x[,1], ratio_corrected = FALSE)
with_ratio <- phiDelta.stats(x[,-1],x[,1])



