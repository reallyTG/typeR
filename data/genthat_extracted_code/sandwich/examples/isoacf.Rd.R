library(sandwich)


### Name: isoacf
### Title: Isotonic Autocorrelation Function
### Aliases: isoacf pava.blocks
### Keywords: regression ts

### ** Examples

x <- filter(rnorm(100), 0.9, "recursive")
isoacf(x)
acf(x, plot = FALSE)$acf



