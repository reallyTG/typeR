library(CINID)


### Name: cinid.table
### Title: Compute the larvae instar in an individual and a population
###   approach.
### Aliases: cinid.table
### Keywords: models

### ** Examples

data(s.oryzae)
soryzae <- s.oryzae$data
mu4.soryzae <- s.oryzae$mu4
sd4.soryzae <- s.oryzae$sd4

HCW.soryzae <- cinid.table(soryzae, mu4 = mu4.soryzae, sd4 = sd4.soryzae)
head(HCW.soryzae$indiv)
HCW.soryzae$pop



