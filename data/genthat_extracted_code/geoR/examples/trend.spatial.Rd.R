library(geoR)


### Name: trend.spatial
### Title: Builds the Trend Matrix
### Aliases: trend.spatial
### Keywords: spatial

### ** Examples

# a first order polynomial trend
trend.spatial("1st", sic.100)[1:5,]
# a second order polynomial trend
trend.spatial("2nd", sic.100)[1:5,]
# a trend with a covariate
trend.spatial(~altitude, sic.100)[1:5,]
# a first degree trend plus a covariate
trend.spatial(~coords+altitude, sic.100)[1:5,]
# with produces the same as
trend.spatial("1st", sic.100, add=~altitude)[1:5,]
# and yet another exemple
trend.spatial("2nd", sic.100, add=~altitude)[1:5,]



