library(WhiteStripe)


### Name: s.hist
### Title: smoothed_histogram
### Aliases: s.hist
### Keywords: datasets

### ** Examples

## Not run: 
##D  
##D data(t2.voi.hist)
##D y = t2.voi.hist$counts
##D x = t2.voi.hist$mids
##D x = x[!is.na(y)];
##D y = y[!is.na(y)]
##D # 70 used for speed of example
##D s.hist = smooth_hist(x, y, k=70)
## End(Not run)



