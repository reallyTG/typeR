library(dplR)


### Name: corr.series.seg
### Title: Compute Correlation between a Series and a Master Chronology
### Aliases: corr.series.seg
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
seg.100 <- corr.series.seg(rwl = dat, series = flagged,
                           seg.length = 100, biweight = FALSE)
## Not run: 
##D flagged2 <- co021$"641143"
##D names(flagged2) <- rownames(dat)
##D seg.100.1 <- corr.series.seg(rwl=dat, seg.length=100, biweight=FALSE,
##D                              series = flagged2)
##D ## Select series by name or column position
##D seg.100.2 <- corr.series.seg(rwl=co021, seg.length=100, biweight=FALSE,
##D                              series = "641143")
##D seg.100.3 <- corr.series.seg(rwl=co021, seg.length=100, biweight=FALSE,
##D                              series = which(colnames(co021) == "641143"))
##D identical(seg.100.1, seg.100.2) # TRUE
##D identical(seg.100.2, seg.100.3) # TRUE
## End(Not run)



