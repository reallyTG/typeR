library(LICORS)


### Name: compute_mixture_penalty
### Title: Penalty of mixture weights
### Aliases: compute_mixture_penalty
### Keywords: array manip

### ** Examples

WW <- matrix(c(rexp(10, 1/10), runif(10), 1/10), ncol = 3, byrow = FALSE)
WW[1, 1] <- 0
WW <- normalize(WW)
compute_mixture_penalty(WW, row.average = FALSE)
compute_mixture_penalty(WW, row.average = TRUE)  # default: average penalty



