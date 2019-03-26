library(DynaRankR)


### Name: informed_ds
### Title: David's Score method informed by prior information
### Aliases: informed_ds

### ** Examples

##Informed ds
female.ranks <- informed_ds(contestants = C.crocuta.female$contestants, convention = 'mri',
initial.ranks = C.crocuta.female$initial.ranks,
interactions = C.crocuta.female$interactions)

##Standard ds
female.ranks <- informed_ds(contestants = C.crocuta.female$contestants, convention = 'none',
interactions = C.crocuta.female$interactions)                          




