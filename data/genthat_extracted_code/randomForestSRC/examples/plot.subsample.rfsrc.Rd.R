library(randomForestSRC)


### Name: plot.subsample
### Title: Plot Subsampled VIMP Confidence Intervals
### Aliases: plot.subsample.rfsrc plot.subsample
### Keywords: plot

### ** Examples

## No test: 
o <- rfsrc(Ozone ~ ., airquality)
oo <- subsample(o)
plot.subsample(oo)
plot.subsample(oo, jknife = FALSE)
plot.subsample(oo, alpha = .01)
plot(oo)
## End(No test)



