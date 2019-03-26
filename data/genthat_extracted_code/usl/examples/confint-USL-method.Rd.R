library(usl)


### Name: confint,USL-method
### Title: Confidence Intervals for USL model parameters
### Aliases: confint,USL-method

### ** Examples

require(usl)

data(specsdm91)

## Create USL model
usl.model <- usl(throughput ~ load, specsdm91)

## Print confidence intervals
confint(usl.model)




