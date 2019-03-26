library(polmineR)


### Name: blapply
### Title: apply a function over a list or bundle
### Aliases: blapply blapply,list-method blapply,vector-method
###   blapply,bundle-method

### ** Examples

use("polmineR")
bt <- partition("GERMAPARLMINI", date = ".*", regex=TRUE)
speeches <- as.speeches(bt, s_attribute_date = "date", s_attribute_name = "speaker")
foo <- blapply(speeches, function(x, ...) slot(x, "cpos"))



