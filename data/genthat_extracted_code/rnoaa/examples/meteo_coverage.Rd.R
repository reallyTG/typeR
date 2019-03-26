library(rnoaa)


### Name: meteo_coverage
### Title: Determine the "coverage" for a station data frame
### Aliases: meteo_coverage

### ** Examples

## Not run: 
##D 
##D monitors <- c("ASN00095063", "ASN00024025", "ASN00040112", "ASN00041023",
##D              "ASN00009998", "ASN00066078", "ASN00003069", "ASN00090162",
##D              "ASN00040126", "ASN00058161")
##D obs <- meteo_pull_monitors(monitors)
##D obs_covr <- meteo_coverage(obs)
##D 
##D library("ggplot2")
##D autoplot(obs_covr)
##D 
## End(Not run)



