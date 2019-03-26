library(scoringRules)


### Name: Supplementary distributions: Real line
### Title: Supplementary distributions (not in base R) supported on the
###   real line.
### Aliases: flapl f2pexp fmixnorm f2pnorm
### Keywords: distributions

### ** Examples

# Plot PDF of Laplace distribution
ff <- function(x) flapl(x, location = 0, scale = 2)
curve(ff, from = -8, to = 8, bty = "n", xlab = "Value", 
      ylab = "PDF", 
      main = "Laplace distribution with location 0 and scale 2")



