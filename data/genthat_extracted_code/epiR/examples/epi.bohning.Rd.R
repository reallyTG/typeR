library(epiR)


### Name: epi.bohning
### Title: Bohning's test for overdispersion of Poisson data
### Aliases: epi.bohning
### Keywords: univar univar

### ** Examples

data(epi.SClip)
obs <- epi.SClip$cases
pop <- epi.SClip$population
exp <- (sum(obs) / sum(pop)) * pop

epi.bohning(obs, exp, alpha = 0.05)




