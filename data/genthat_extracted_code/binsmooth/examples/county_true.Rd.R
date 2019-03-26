library(binsmooth)


### Name: county_true
### Title: ACS County Income Statistics, 2006-2010
### Aliases: county_true
### Keywords: datasets

### ** Examples

data(county_bins)
data(county_true)
binedges <- county_bins$bin_max[county_bins$fips=="6083"]+0.5 # continuity correction
bincounts <- county_bins$households[county_bins$fips=="6083"]
smean <- county_true$mean_true[county_true$fips=="6083"]
plot(stepbins(binedges, bincounts, smean)$stepPDF, do.points=FALSE,
     main="Santa Barbara County")



