library(lattice)


### Name: D_make.groups
### Title: Grouped data from multiple vectors
### Aliases: make.groups
### Keywords: dplot

### ** Examples

sim.dat <-
    make.groups(uniform = runif(200),
                exponential = rexp(175),
                lognormal = rlnorm(150),
                normal = rnorm(125))
qqmath( ~ data | which, sim.dat, scales = list(y = "free"))



