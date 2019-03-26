library(adegraphics)


### Name: s1d.density
### Title: 1-D plot of a numeric score by density curves
### Aliases: s1d.density
### Keywords: aplot hplot

### ** Examples

score <- c(rnorm(1000, mean = -0.5, sd = 0.5), rnorm(1000, mean = 1))
fac <- rep(c("A", "B"), each = 1000)
s1d.density(score, fac, col = c(2, 4), p1d.reverse = TRUE)



