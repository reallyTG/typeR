library(coala)


### Name: feat_outgroup
### Title: Feature: Outgroup
### Aliases: feat_outgroup

### ** Examples

# A simple finite sites model
model <- coal_model(c(4, 6, 1), 2, 10) +
   feat_outgroup(3) +
   feat_pop_merge(0.5, 2, 1) +
   feat_pop_merge(2, 3, 1) +
   feat_mutation(5, model = "GTR", gtr_rates = 1:6)



