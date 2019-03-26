library(coala)


### Name: feat_mutation
### Title: Feature: Mutation
### Aliases: feat_mutation

### ** Examples

# A model with a constant mutation rate of 5:
model <- coal_model(5, 1) + feat_mutation(5) + sumstat_seg_sites()
simulate(model)

# A model with a mutation of 5.0 for the first 10 loci, and 7.5 for the
# second 10 loci
model <- coal_model(4) +
  locus_averaged(10, 100) +
  locus_averaged(10, 100) +
  feat_mutation(5.0, locus_group = 1) +
  feat_mutation(7.5, locus_group = 2) +
  sumstat_seg_sites()
simulate(model)

# A model with 7 mutations per locus:
model <- coal_model(5, 1) +
  feat_mutation(7, fixed = TRUE) +
  sumstat_seg_sites()
## Not run: simulate(model)

# A model using the HKY model:
model <- coal_model(c(10, 1), 2) +
 feat_mutation(7.5, model = "HKY", tstv_ratio = 2,
               base_frequencies = c(.25, .25, .25, .25)) +
  feat_outgroup(2) +
  feat_pop_merge(1.0, 2, 1) +
  sumstat_seg_sites()
## Not run: simulate(model)

# A model using the GTR model:
model <- coal_model(c(10, 1), 1, 25) +
  feat_mutation(7.5, model = "GTR",
                gtr_rates = c(1, 1, 1, 1, 1, 1) / 6) +
  feat_outgroup(2) +
  feat_pop_merge(1.0, 2, 1) +
  sumstat_dna()
## Not run: simulate(model)$dna



