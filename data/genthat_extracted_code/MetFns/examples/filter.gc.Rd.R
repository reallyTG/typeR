library(MetFns)


### Name: filter.gc
### Title: Selection of visual meteor data by geographical coordinates
### Aliases: filter.gc

### ** Examples

## select 2015 rate and magnitude data for observing site with latitude 44.1583N 
## and longitude 19.6869E
filter.gc(rate2015,lat.low=44.1583,lat.up=44.1583,long.low=19.6869,long.up=19.6869)
filter.gc(magn2015,lat.low=44.1583,lat.up=44.1583,long.low=19.6869,long.up=19.6869)

## select 2015 rate and magnitude data corresponding to sites with latitude 60N and above
filter.gc(rate2015,lat.low=60)
filter.gc(magn2015,lat.low=60)



