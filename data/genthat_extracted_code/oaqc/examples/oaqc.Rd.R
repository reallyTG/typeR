library(oaqc)


### Name: oaqc
### Title: Orbit-aware Quad Census computation
### Aliases: oaqc oaqc-package oaqc

### ** Examples

k4 <- data.frame(
  source = c(0, 0, 0, 1, 1, 2),
  target = c(1, 2, 3, 2, 3, 3)
)

k4orbits <- oaqc(k4, non_ind_freq = TRUE)
print(k4orbits)



