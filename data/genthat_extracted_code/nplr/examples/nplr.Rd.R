library(nplr)


### Name: nplr
### Title: Function to Fit n-Parameter Logistic Regressions.
### Aliases: nplr nplr-class

### ** Examples

# Using the PC-3 data
  require(nplr)
  path <- system.file("extdata", "pc3.txt", package = "nplr")
  pc3 <- read.delim(path)
  model <- nplr(x = pc3$CONC, y = pc3$GIPROP)
  plot(model)



