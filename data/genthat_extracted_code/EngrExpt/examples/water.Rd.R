library(EngrExpt)


### Name: water
### Title: Bacteria concentrations in water samples
### Aliases: water
### Keywords: datasets

### ** Examples

str(water)
qqmath(~ bacteria, water, aspect = 1,
       xlab = "Standard normal quantiles",
       ylab = "Bacteria concentration (ppm)")
histogram(~ bacteria, water, breaks = 0:14 - 0.5,
          xlab = "Bacteria concentration (ppm)")
xtabs(~ bacteria, water)



