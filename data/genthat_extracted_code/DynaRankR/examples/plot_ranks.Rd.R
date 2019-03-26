library(DynaRankR)


### Name: plot_ranks
### Title: Plot individual ranks or scores
### Aliases: plot_ranks

### ** Examples

female.ranks <- informed_elo(contestants = C.crocuta.female$contestants, convention = 'mri',
initial.ranks = C.crocuta.female$initial.ranks,
interactions = C.crocuta.female$interactions)

plot_ranks(female.ranks, type = 'rank')
plot_ranks(female.ranks, type = 'score')
plot_ranks(female.ranks, type = 'stan.rank')




