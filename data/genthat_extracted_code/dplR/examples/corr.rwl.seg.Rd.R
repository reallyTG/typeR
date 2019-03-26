library(dplR)


### Name: corr.rwl.seg
### Title: Compute Correlations between Series
### Aliases: corr.rwl.seg
### Keywords: manip

### ** Examples
library(utils)
data(co021)
crs <- corr.rwl.seg(co021, seg.length = 100, label.cex = 1.25)
names(crs)
## Average correlation and p-value for the first few series
head(crs$overall)
## Average correlation for each bin
crs$avg.seg.rho



