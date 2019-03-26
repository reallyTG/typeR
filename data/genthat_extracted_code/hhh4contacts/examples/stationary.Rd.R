library(hhh4contacts)


### Name: stationary
### Title: Stationary Distribution of a Transition Matrix
### Aliases: stationary

### ** Examples

Cgrouped_norm <- contactmatrix(normalize = TRUE)
Cgrouped_norm
(p <- stationary(Cgrouped_norm))
(Cpowered <- make_powerC(Cgrouped_norm)(1e6))
stopifnot(all.equal(Cpowered[1,], p))



