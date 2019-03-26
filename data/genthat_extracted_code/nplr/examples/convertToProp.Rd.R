library(nplr)


### Name: convertToProp
### Title: Function to Convert a Vector Into Proportions.
### Aliases: convertToProp
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Using the MDA-N data
  op <- par(no.readonly=TRUE)         # save default parameters

  require(nplr)
  path <- system.file("extdata", "mdan.txt", package = "nplr")
  mdan <- read.delim(path)
  
# fit a model on the original responses (proportions of control):
  conc <- mdan$CONC
  y0 <- mdan$GIPROP
  model0 <- nplr(conc, y0)

# Adjust the data between 0 to 1, then fit a new model:
  y1 <- convertToProp(y0)
  model1 <- nplr(conc, y1)
  
  par(mfrow=c(1, 2))
  plot(model0, ylim = range(0, 1), main = "Original y values")
  plot(model1, ylim = range(0, 1), main = "Rescaled y values")
  par(op)



