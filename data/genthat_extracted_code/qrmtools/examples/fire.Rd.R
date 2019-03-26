library(qrmtools)


### Name: fire
### Title: Danish Fire Insurance Claims
### Aliases: fire
### Keywords: datasets

### ** Examples

library(xts)
data("fire")
str(fire)
stopifnot(inherits(fire, "xts"), length(fire) == 2167)
plot.zoo(fire, ylab = "Fire insurance claim")



