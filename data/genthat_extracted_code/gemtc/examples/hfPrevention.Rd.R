library(gemtc)


### Name: hfPrevention
### Title: Statins versus placebo in primary and secondary prevention of
###   heart failure
### Aliases: hfPrevention

### ** Examples

# Build a model similar to Program 1(a) from Dias et al. (2013b):
regressor <- list(coefficient='shared',
                  variable='secondary',
                  control='control')

model <- mtc.model(hfPrevention,
                   type="regression",
                   regressor=regressor,
                   hy.prior=mtc.hy.prior("std.dev", "dunif", 0, 5))

## Not run: 
##D result <- mtc.run(model)
## End(Not run)



