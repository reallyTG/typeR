library(GCalignR)


### Name: linear_transformation
### Title: Full Alignment of Peak Lists by linear retention time
###   correction.
### Aliases: linear_transformation

### ** Examples

dat <- peak_data[1:10]
dat <- lapply(dat, function(x) x[1:50,])
x <- linear_transformation(gc_peak_list = dat, reference = "C2", rt_col_name = "time")




