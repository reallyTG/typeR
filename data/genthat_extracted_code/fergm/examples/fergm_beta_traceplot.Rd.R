library(fergm)


### Name: fergm_beta_traceplot
### Title: Plot traceplots for model terms.
### Aliases: fergm_beta_traceplot
### Keywords: FERGM interpret summary

### ** Examples

# load example data
data("ergm.fit")
data("fergm.fit")
data("mesa")
# Use rstan's built in traceplot function
trace <- rstan::traceplot(fergm.fit$stan.fit, pars = "beta")
trace

# We have our own version that includes variable names and tidies it up a bit
fergm_beta_traceplot(fergm.fit,
                    custom_var_names =  c("Edges", "Sex Homophily",
                    "Grade Homophily", "Race Homophily", "GWESP", "Alternating K-Stars"))



