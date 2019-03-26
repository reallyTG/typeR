library(EffectStars2)


### Name: election
### Title: Election Data
### Aliases: election
### Keywords: datasets multinomial response

### ** Examples


data(election) 
library(VGAM)
m_elect <- vglm(Partychoice ~ Gender + West + Age + Union + Highschool + Unemployment
+ Pol.Interest + Democracy + Religion, family = multinomial(), data = election)

effectstars(m_elect)




