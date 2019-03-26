library(rstap)


### Name: as.matrix.stapreg
### Title: Extract the posterior sample via matrix
### Aliases: as.matrix.stapreg as.array.stapreg as.data.frame.stapreg

### ** Examples

## No test: 
if (!exists("example_model")) example(example_model)
# Extract posterior sample after MCMC
draws <- as.matrix(example_model)
print(dim(draws))

# For example, we can see that the median of the draws for the intercept 
# is the same as the point estimate rstanarm uses
print(median(draws[, "(Intercept)"]))
print(example_model$coefficients[["(Intercept)"]])

# The as.array method keeps the chains separate
draws_array <- as.array(example_model)
print(dim(draws_array)) # iterations x chains x parameters
## End(No test)



