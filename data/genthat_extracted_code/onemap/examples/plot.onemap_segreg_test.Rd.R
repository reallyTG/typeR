library(onemap)


### Name: plot.onemap_segreg_test
### Title: Plot p-values for chi-square tests of expected segregation
### Aliases: plot.onemap_segreg_test

### ** Examples


data(mapmaker_example_bc) # load OneMap's fake dataset for a backcross population
BC.seg <- test_segregation(mapmaker_example_bc) # Applies chi-square tests
print(BC.seg) # Shows the results
plot(BC.seg) # Plot the graph, ordering the p-values
plot(BC.seg, order=FALSE) # Plot the graph showing the results keeping the order in the dataset
# You can store the graphic in an object, then save it.
# For details, see the help of ggplot2's function ggsave()
# g <- plot(BC.seg)
# ggplot2::ggsave("SegregationTests.jpg", g, width=7, height=5, dpi=600)

data(example_out) # load OneMap's fake dataset for an outcrossing population
Out.seg <- test_segregation(example_out) # Applies chi-square tests
print(Out.seg) # Shows the results
plot(Out.seg) # Plot the graph, ordering the p-values
plot(Out.seg, order=FALSE) # Plot the graph showing the results keeping the order in the dataset
# You can store the graphic in an object, then save it.
# For details, see the help of ggplot2's function ggsave()
g <- plot(Out.seg)
ggplot2::ggsave("SegregationTests.jpg", g, width=7, height=5, dpi=600)





