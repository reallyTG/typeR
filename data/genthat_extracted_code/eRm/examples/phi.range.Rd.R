library(eRm)


### Name: phi.range
### Title: Example User Function
### Aliases: phi.range
### Keywords: misc

### ** Examples

ctr <- rsctrl(burn_in = 10, n_eff = 5, step=10, seed = 123, tfixed = FALSE)
mat <- matrix(sample(c(0,1), 50, replace = TRUE), nr = 10)
rso <- rsampler(mat, ctr)
rso_st <- rstats(rso,phi.range)
print(unlist(rso_st))



