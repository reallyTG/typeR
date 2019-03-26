library(coala)


### Name: feat_unphased
### Title: Feature: Unphased Sequences
### Aliases: feat_unphased

### ** Examples

# Simulate unphased data in a diploid population
model <- coal_model(10, 1, ploidy = 2) +
  feat_mutation(10) +
  feat_unphased(2) +
  sumstat_seg_sites()
simulate(model)

# The same as before, but return only one chromosome for
# each individual:
model <- coal_model(10, 1, ploidy = 2) +
  feat_mutation(10) +
  feat_unphased(1) +
  sumstat_seg_sites()
simulate(model)



