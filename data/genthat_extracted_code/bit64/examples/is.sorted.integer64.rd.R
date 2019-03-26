library(bit64)


### Name: is.sorted.integer64
### Title: Small cache access methods
### Aliases: is.sorted.integer64 na.count.integer64 nvalid.integer64
###   nunique.integer64 nties.integer64
### Keywords: environment methods

### ** Examples

	x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
 length(x)
 na.count(x)
 nvalid(x)
 nunique(x)
 nties(x)
 table.integer64(x)
 x



