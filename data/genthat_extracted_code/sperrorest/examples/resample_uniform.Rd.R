library(sperrorest)


### Name: resample_uniform
### Title: Draw uniform random (sub)sample
### Aliases: resample_uniform

### ** Examples

data(ecuador) # Muenchow et al. (2012), see ?ecuador
d <- resample_uniform(ecuador, param = list(strat = 'slides', n = 200))
nrow(d) # == 200
sum(d$slides == 'TRUE')




