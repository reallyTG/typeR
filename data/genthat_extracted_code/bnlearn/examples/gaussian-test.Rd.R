library(bnlearn)


### Name: gaussian.test
### Title: Synthetic (continuous) data set to test learning algorithms
### Aliases: gaussian.test
### Keywords: datasets

### ** Examples

# load the data.
data(gaussian.test)
# create and plot the network structure.
dag = model2network("[A][B][E][G][C|A:B][D|B][F|A:D:E:G]")
## Not run: graphviz.plot(dag)



