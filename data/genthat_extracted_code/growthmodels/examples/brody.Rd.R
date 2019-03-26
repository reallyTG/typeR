library(growthmodels)


### Name: brody
### Title: Brody growth model
### Aliases: brody brody.inverse

### ** Examples

growth <- brody(0:10, 10, 5, 0.3)
# Calculate inverse function
time <- brody.inverse(growth, 10, 5, 0.3)



