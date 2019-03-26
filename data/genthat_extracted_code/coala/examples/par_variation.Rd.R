library(coala)


### Name: par_variation
### Title: Variable Parameters
### Aliases: par_variation

### ** Examples

model <- coal_model(5, 10) +
  feat_mutation(par_variation(par_const(5), 10)) +
  sumstat_nucleotide_div()
simulate(model)



