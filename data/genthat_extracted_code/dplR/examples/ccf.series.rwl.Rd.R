library(dplR)


### Name: ccf.series.rwl
### Title: Cross-Correlation between a Series and a Master Chronology
### Aliases: ccf.series.rwl
### Keywords: manip

### ** Examples

library(utils)
data(co021)
dat <- co021
## Create a missing ring by deleting a year of growth in a random series
flagged <- dat$"641143"
flagged <- c(NA, flagged[-325])
names(flagged) <- rownames(dat)
dat$"641143" <- NULL
ccf.100 <- ccf.series.rwl(rwl = dat, series = flagged, seg.length = 100)
## Not run: 
##D flagged2 <- co021$"641143"
##D names(flagged2) <- rownames(dat)
##D ccf.100.1 <- ccf.series.rwl(rwl = dat, seg.length = 100,
##D                             series = flagged2)
##D ## Select series by name or column position
##D ccf.100.2 <- ccf.series.rwl(rwl = co021, seg.length = 100,
##D                             series = "641143")
##D ccf.100.3 <- ccf.series.rwl(rwl = co021, seg.length = 100,
##D                             series = which(colnames(co021) == "641143"))
##D identical(ccf.100.1, ccf.100.2) # TRUE
##D identical(ccf.100.2, ccf.100.3) # TRUE
## End(Not run)



