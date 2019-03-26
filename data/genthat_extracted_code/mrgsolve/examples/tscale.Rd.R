library(mrgsolve)


### Name: tscale
### Title: Rescale time in the simulated output
### Aliases: tscale

### ** Examples

# The model is in hours:
mod <- mrgsolve:::house()

# The output is in days:
mod %>% tscale(1/24) %>% mrgsim




