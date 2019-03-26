library(BatchMap)


### Name: plot.onemap.segreg.test
### Title: Plot p-values for chi-square tests of expected segregation
### Aliases: plot.onemap.segreg.test

### ** Examples

data(example.out) # load OneMap's fake dataset for an outcrossing population
Out.seg <- test.segregation(example.out) # Applies chi-square tests
print(Out.seg) # Shows the results
plot(Out.seg) # Plot the graph, ordering the p-values
plot(Out.seg, order=FALSE) # Plot the graph showing the results keeping the order in the dataset
# You can store the graphic in an object, then save it.
# For details, see the help of ggplot2's function ggsave()
g <- plot(Out.seg)
ggsave("SegregationTests.jpg", g, width=7, height=5, dpi=600)




