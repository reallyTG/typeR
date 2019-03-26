library(geoknife)


### Name: parseTimeseries
### Title: parse timeseries file into R environment
### Aliases: parseTimeseries
### Keywords: methods

### ** Examples

local_file <- system.file('extdata','tsv_linear_ring.tsv', package = 'geoknife')
output <- parseTimeseries(local_file, delim = '\t')



