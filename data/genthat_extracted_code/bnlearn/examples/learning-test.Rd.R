library(bnlearn)


### Name: learning.test
### Title: Synthetic (discrete) data set to test learning algorithms
### Aliases: learning.test
### Keywords: datasets

### ** Examples

# load the data.
data(learning.test)
# create and plot the network structure.
dag = model2network("[A][C][F][B|A][D|A:C][E|B:F]")
## Not run: graphviz.plot(dag)



