library(castor)


### Name: count_clades_over_time
### Title: Count number of clades over time.
### Aliases: count_clades_over_time
### Keywords: trait evolution

### ** Examples

# generate a random tree
tree = generate_random_tree(list(birth_rate_intercept=1), max_tips=1000)$tree

# count clades over time
results = count_clades_over_time(tree, Ntimes=100)

# plot curve (number of clades vs time)
plot(results$times, results$diversities, type="l", xlab="time", ylab="# clades")



