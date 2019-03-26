library(Bolstad)


### Name: decomp
### Title: Plot the prior, likelihood, and posterior on the same plot.
### Aliases: decomp
### Keywords: plots

### ** Examples


# an example with a binomial sampling situation
results = binobp(4, 12, 3, 3, plot = FALSE)
decomp(results)

# an example with normal data
y = c(2.99,5.56,2.83,3.47)
results = normnp(y, 3, 2, 1, plot = FALSE)
decomp(results)




