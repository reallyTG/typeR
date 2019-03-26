library(DynaRankR)


### Name: get_dynamics
### Title: Calculate hierarchy dynamics
### Aliases: get_dynamics

### ** Examples

female.ranks <- informed_elo(contestants = C.crocuta.female$contestants, convention = 'mri',
initial.ranks = C.crocuta.female$initial.ranks,
interactions = C.crocuta.female$interactions)

female.ranks.score <- get_dynamics(ranks = female.ranks, type = 'score')
female.ranks.rank <- get_dynamics(ranks = female.ranks, type = 'rank')




