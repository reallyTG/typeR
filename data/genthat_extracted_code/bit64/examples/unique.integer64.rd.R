library(bit64)


### Name: unique.integer64
### Title: Extract Unique Elements from integer64
### Aliases: unique.integer64
### Keywords: manip logic

### ** Examples

x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
unique(x)
unique(x, order="values")

stopifnot(identical(unique(x),  x[!duplicated(x)]))
stopifnot(identical(unique(x),  as.integer64(unique(as.integer(x)))))
stopifnot(identical(unique(x, order="values")
,  as.integer64(sort(unique(as.integer(x)), na.last=FALSE))))



