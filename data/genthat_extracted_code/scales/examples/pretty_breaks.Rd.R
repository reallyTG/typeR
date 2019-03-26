library(scales)


### Name: pretty_breaks
### Title: Pretty breaks. Uses default R break algorithm as implemented in
###   'pretty()'.
### Aliases: pretty_breaks

### ** Examples

pretty_breaks()(1:10)
pretty_breaks()(1:100)
pretty_breaks()(as.Date(c("2008-01-01", "2009-01-01")))
pretty_breaks()(as.Date(c("2008-01-01", "2090-01-01")))



