library(admixturegraph)


### Name: fit_permutations_and_graphs
### Title: Fit lots of graphs to data.
### Aliases: fit_permutations_and_graphs

### ** Examples

## No test: 
# Let's experiment by fitting all the graphs with five leaves and at most one admixture
# event to a five population subset of the bear data. Note that with three data rows only
# we do wisely by not concluding too much about the actual bear family tree; this is to
# illustrate the function usage only!

data(bears)
data <- bears[16:18, ]
print(data)
permutations <- make_permutations(c("PB", "BLK", "Sweden", "Denali", "Kenai"))
graphs <- five_leaves_graphs

# We go with one core only as I don't know what kind of machine you are using.

fitted_graphs <- fit_permutations_and_graphs(data, permutations, graphs, 1)

# Now sort the fitted objects by best_error and see how the best graph looks like.

errors <- sapply(fitted_graphs, function(x) x$best_error)
best_graphs <- fitted_graphs[order(errors)]
plot(best_graphs[[1]]$graph, color = "goldenrod", title = best_graphs[[1]]$best_error)

# The same value for best_error actually occurs in the list 152 times because of our
# unsufficient data.
## End(No test)




