library(jwutil)


### Name: fastIntToString
### Title: Fast convert integer vector to character vector
### Aliases: fastIntToString fastIntToStringStd fastIntToStringRcpp
### Keywords: internal

### ** Examples

## Not run: 
##D pts <- generate_random_pts(1e7)
##D # conclusion: buffer size matters little (so default to be more generous),
##D # and Rcpp version fastest.
##D microbenchmark::microbenchmark(fastIntToStringStd(pts$visit_id, buffer = 8),
##D                                fastIntToStringStd(pts$visit_id, buffer = 16),
##D                                fastIntToStringStd(pts$visit_id, buffer = 64),
##D                                fastIntToStringRcpp(pts$visit_id, buffer = 8),
##D                                fastIntToStringRcpp(pts$visit_id, buffer = 16),
##D                                fastIntToStringRcpp(pts$visit_id, buffer = 64),
##D                                as.character(pts$visit_id),
##D                                as_char_no_warn(pts$visit_id), times = 5)
## End(Not run)



