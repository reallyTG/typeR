library(coala)


### Name: feat_ignore_singletons
### Title: Feature: Ignore Singletons
### Aliases: feat_ignore_singletons

### ** Examples

model <- coal_model(2, 1) +
  feat_mutation(10) +
  feat_ignore_singletons() +
  sumstat_sfs("n_mut", transformation = sum)
# In this model, all mutations are singletons. Therefore,
# the number of mutations is 0 when removing singletons:
simulate(model)$n_mut



