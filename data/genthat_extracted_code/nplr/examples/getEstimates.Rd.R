library(nplr)


### Name: getEstimates
### Title: Function to Estimate x Given y.
### Aliases: getEstimates getEstimates-methods getEstimates,nplr-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Using the PC-3 data
  require(nplr)
  path <- system.file("extdata", "pc3.txt", package="nplr")
  pc3 <- read.delim(path)
  model <- nplr(x = pc3$CONC, y = pc3$GIPROP)
  getEstimates(model)
  getEstimates(model, c(.3, .6), conf.level = .9)



