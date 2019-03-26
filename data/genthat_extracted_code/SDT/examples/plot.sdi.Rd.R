library(SDT)


### Name: plot.sdi
### Title: Plot Method for Objects of Class sdi
### Aliases: plot.sdi
### Keywords: hplot methods

### ** Examples

## attach dataset to search path (so a variable can be accessed by name)
attach(learning_motivation)

## adjusted index plot
plot(sdi(intrinsic, identified, introjected, external))

## original index plot
plot(sdi(intrinsic, identified, introjected, external, compute.adjusted = FALSE))



