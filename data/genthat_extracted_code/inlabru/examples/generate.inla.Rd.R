library(inlabru)


### Name: generate.inla
### Title: Sampling based on bru posteriors
### Aliases: generate.inla

### ** Examples

## No test: 
# Some features use the INLA package.
if (require("INLA", quietly = TRUE)) {

# Generate some data

input.df <- data.frame(x=cos(1:10))
input.df <- within(input.df, y <- 5 + 2*cos(1:10) + rnorm(10, mean=0, sd=0.1))

# Fit a Gaussian likelihood model

formula = y ~ x
fit <- inla(formula, "gaussian", data = input.df, control.compute=list(config = TRUE))

# Generate samples from the posterior distribution of exp(x), where x is the fixed effect.

xpost = generate(fit, NULL, ~ exp(x), n.samples = 2)
xpost
plot(xpost[[1]])

}
## End(No test)



