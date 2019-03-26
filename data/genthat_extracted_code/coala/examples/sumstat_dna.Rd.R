library(coala)


### Name: sumstat_dna
### Title: Summary Statistic: DNA
### Aliases: sumstat_dna

### ** Examples

model <- coal_model(5, 1, 10) +
 feat_mutation(5, model = "GTR", gtr_rates = rep(1, 6)) +
 sumstat_dna()
## Not run: simulate(model)$dna



