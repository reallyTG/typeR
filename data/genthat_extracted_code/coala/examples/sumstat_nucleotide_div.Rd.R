library(coala)


### Name: sumstat_nucleotide_div
### Title: Summary Statistic: Nucleotide Diversity
### Aliases: sumstat_nucleotide_div

### ** Examples

model <- coal_model(5, 2) +
  feat_mutation(5) +
  sumstat_nucleotide_div()
stats <- simulate(model)
print(stats$pi)



