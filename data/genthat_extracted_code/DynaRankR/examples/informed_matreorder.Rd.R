library(DynaRankR)


### Name: informed_matreorder
### Title: Infer longitudinal hierarchy using informed matrix reordering
### Aliases: informed_matreorder

### ** Examples

conts <- C.crocuta.female$contestants[C.crocuta.female$contestants$period <= 1990,]
female.ranks <- informed_matreorder(contestants = conts, 
convention = 'mri', n =1, shuffles = 10, require.corroboration = TRUE, 
initial.ranks = C.crocuta.female$initial.ranks,
interactions = C.crocuta.female$interactions)





