library(distdichoR)


### Name: regdistdicho
### Title: normal, skew-normal or gamma distributed data (via linear
###   regression)
### Aliases: regdistdicho

### ** Examples

## Proportions of low birth weight babies among smoking and non-smoking mothers
## (data from Peacock et al. 1995)
mod_smoke <- lm(birthwt ~ smoke + gest, data = bwsmoke)
regdistdicho(mod = mod_smoke, group_var = 'smoke', cp = 2500, tail = 'lower')



