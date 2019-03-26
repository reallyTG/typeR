library(coala)


### Name: sumstat_trees
### Title: Summary Statistic: Ancestral Trees
### Aliases: sumstat_trees

### ** Examples

# Without recombination:
model <- coal_model(4, 2) + sumstat_trees()
stats <- simulate(model)
print(stats$trees)

# With recombination:
model <- model + feat_recombination(5)
stats <- simulate(model)
print(stats$trees)



