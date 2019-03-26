library(binsmooth)


### Name: simcounty
### Title: Simulate data to mimic 'county_bins' and 'county_true'
### Aliases: simcounty

### ** Examples

l <- simcounty(5)
cb <- l$county_bins
ct <- l$county_true
sbl <- splinebins(cb$bin_max[cb$fips==103], cb$households[cb$fips==103],
                  ct$mean_true[ct$fips==103])
stl <- stepbins(cb$bin_max[cb$fips==105], cb$households[cb$fips==105],
                ct$mean_true[ct$fips==105])
plot(sbl$splinePDF, 0, 300000, n=500)
plot(stl$stepPDF, do.points=FALSE, main=cb$county[cb$fips==105][1])



