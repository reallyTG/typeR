library(MSEtool)


### Name: profile_likelihood
### Title: Profile likelihood of assessment models
### Aliases: profile_likelihood

### ** Examples

## No test: 
output <- DD_TMB(Data = DLMtool::Red_snapper)
pro <- profile_likelihood(output, R0 = seq(0.75, 1.25, 0.025), h = seq(0.9, 0.99, 0.01),
save_figure = FALSE)

# Ensure your grid is of proper resolution. A grid that is too coarse will distort the shape of
# the likelihood surface.
## End(No test)



