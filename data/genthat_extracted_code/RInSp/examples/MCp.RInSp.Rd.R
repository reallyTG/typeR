library(RInSp)


### Name: MCp.RInSp
### Title: Monte Carlo resampling procedure
### Aliases: MCp.RInSp
### Keywords: univar models

### ** Examples

# Monte Carlo resampling for NODF
# EXAMPLE NOT RUN
# with stickleback data from Bolnick and Paull 2009
# data(Stickleback)
# Select a single spatial sampling site (site A)
# SiteA = import.RInSp(Stickleback, row.names = 1,
# info.cols = c(2:13), subset.rows = c("Site", "A"))
# nreplicates = 999
# Null.data = MCp.RInSp(SiteA, replicates = nreplicates)
# Build a vector holding real and resampled results
# the NODF values and warning messages from import.RInSp
# are printed, too.
# null.d.NODF = c()
# for (i in 1:(nreplicates + 1)) {
#   null.d.NODF = c(null.d.NODF, NODF(import.RInSp(Null.data[ , , i], print.messages=FALSE),
#  print.results=FALSE)$NODF)
# }
# hist(null.d.NODF)
# summary(null.d.NODF)
# Observed value of NODF from data
# null.d.NODF[1]
# rm(list=ls(all=TRUE))



