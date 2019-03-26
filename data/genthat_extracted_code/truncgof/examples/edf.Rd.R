library(truncgof)


### Name: edf
### Title: Empirical distribution function
### Aliases: edf
### Keywords: dplot distribution

### ** Examples

set.seed(123)
treshold <- 10
xc <- rlnorm(30, meanlog = 2, sdlog = 1)    # complete sample
xt <- xc[xc >= treshold]                    # truncated sample

# the results are identical:
plot(edf(xc))
plot(ecdf(xc))

# considering truncated samples:
plot(edf(xt))   # wrong plot
plot(edf(xt, "plnorm", list(meanlog = 2, sdlog = 1), H = 10))



