library(DynaRankR)


### Name: informed_elo
### Title: Elo-rating method informed by prior information
### Aliases: informed_elo

### ** Examples

##Informed elo
female.ranks <- informed_elo(contestants = C.crocuta.female$contestants, convention = 'mri',
initial.ranks = C.crocuta.female$initial.ranks,
interactions = C.crocuta.female$interactions)

##Standard elo
female.ranks <- informed_elo(contestants = C.crocuta.female$contestants, convention = 'none',
interactions = C.crocuta.female$interactions)




