library(CTRE)


### Name: ctre
### Title: CTRE model
### Aliases: ctre

### ** Examples

times <- cumsum(MittagLeffleR::rml(n = 1000, tail = 0.8, scale = 5))
magnitudes <- rexp(n = 1000)
sim_ctre <- ctre(times, magnitudes)
sim_ctre
plot(sim_ctre)

library(magrittr)
bitcoin_ctre <- bitcoin %>% ctre() %>% thin(k = 400)
plot(bitcoin_ctre, log = 'y')



