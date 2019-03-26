library(coala)


### Name: sumstat_four_gamete
### Title: Summary Statistic: Four-Gamete-Condition
### Aliases: sumstat_four_gamete

### ** Examples

model <- coal_model(5, 2) +
 feat_mutation(50) +
 feat_recombination(10) +
 sumstat_four_gamete()
stats <- simulate(model)
print(stats$four_gamete)



