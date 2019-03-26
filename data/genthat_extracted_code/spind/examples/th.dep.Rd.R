library(spind)


### Name: th.dep
### Title: Spatial threshold-dependent accuracy measures
### Aliases: th.dep

### ** Examples

data(hook)
data <- hook[ ,1:2]
coord <- hook[ ,3:4]
si1 <- th.dep(data, coord, spatial = TRUE)
si1$kappa
si1$cm




