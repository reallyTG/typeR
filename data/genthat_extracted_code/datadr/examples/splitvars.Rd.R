library(datadr)


### Name: getSplitVar
### Title: Extract "Split" Variable(s)
### Aliases: getSplitVar getSplitVars

### ** Examples

d <- divide(iris, by = "Species",
  bsvFn = function(x)
    list(msl = bsv(mean(x$Sepal.Length))))
getSplitVars(d[[1]]$value)
getSplitVar(d[[1]]$value, "Species")



