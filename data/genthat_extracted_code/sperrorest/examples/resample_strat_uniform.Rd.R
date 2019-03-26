library(sperrorest)


### Name: resample_strat_uniform
### Title: Draw stratified random sample
### Aliases: resample_strat_uniform

### ** Examples

data(ecuador) # Muenchow et al. (2012), see ?ecuador
d <- resample_strat_uniform(ecuador,
                            param = list(strat = 'slides', nstrat = 100))
nrow(d) # == 200
sum(d$slides == 'TRUE') # == 100




