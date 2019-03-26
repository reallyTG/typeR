library(IsoGene)


### Name: IsoPlot
### Title: IsoPlot
### Aliases: IsoPlot
### Keywords: hplot

### ** Examples

  x <- c(rep(1,3), rep(2,3), rep(3,3), rep(4,3))
  y <- c(rnorm(3,1,1), rnorm(3,2,1), rnorm(3,3,1), rnorm(3,4,1))
  IsoPlot(x, y)
  IsoPlot(x, y, type="ordinal", add.curve=TRUE)



