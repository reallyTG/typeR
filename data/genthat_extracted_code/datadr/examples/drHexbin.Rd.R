library(datadr)


### Name: drHexbin
### Title: HexBin Aggregation for Distributed Data Frames
### Aliases: drHexbin

### ** Examples

# create dummy data and divide it
dat <- data.frame(
  xx = rnorm(1000),
  yy = rnorm(1000),
  by = sample(letters, 1000, replace = TRUE))
d <- divide(dat, by = "by", update = TRUE)
# compute hexbins on divided object
dhex <- drHexbin(d, xVar = "xx", yVar = "yy")
# dhex is equivalent to running on undivided data:
hexbin(dat$xx, dat$yy)



