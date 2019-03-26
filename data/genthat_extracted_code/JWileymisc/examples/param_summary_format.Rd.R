library(JWileymisc)


### Name: param_summary_format
### Title: Format a data frame of summary statistics
### Aliases: param_summary_format
### Keywords: utilities

### ** Examples

set.seed(1234)
xsum <- do.call(rbind, apply(matrix(rnorm(100*10), ncol = 10),
  2, param_summary))
rownames(xsum) <- letters[1:10]
param_summary_format(xsum)
param_summary_format(xsum, pretty = TRUE)

rm(xsum)



