library(bnlearn)


### Name: clgaussian.test
### Title: Synthetic (mixed) data set to test learning algorithms
### Aliases: clgaussian.test
### Keywords: datasets

### ** Examples

# load the data.
data(clgaussian.test)
# create and plot the network structure.
dag = model2network("[A][B][C][H][D|A:H][F|B:C][E|B:D][G|A:D:E:F]")
## Not run: graphviz.plot(dag)



