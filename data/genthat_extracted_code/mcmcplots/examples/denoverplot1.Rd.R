library(mcmcplots)


### Name: denoverplot1
### Title: Plot Overlaying Densities
### Aliases: denoverplot1
### Keywords: hplot

### ** Examples

denoverplot1(rnorm(1000), rnorm(1000))
denoverplot1(rnorm(1000, 0.0, 1.0), rnorm(1000, 0.1, 1.0),
             style="plain", col=mcmcplotsPalette(2, type="grayscale"),
             ci=0.95)
denoverplot1(list(rgamma(1000, 1, 1), rgamma(1000, 1, 1)))



