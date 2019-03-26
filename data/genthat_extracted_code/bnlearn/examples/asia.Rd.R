library(bnlearn)


### Name: asia
### Title: Asia (synthetic) data set by Lauritzen and Spiegelhalter
### Aliases: asia
### Keywords: datasets

### ** Examples

# load the data.
data(asia)
# create and plot the network structure.
dag = model2network("[A][S][T|A][L|S][B|S][D|B:E][E|T:L][X|E]")
## Not run: graphviz.plot(dag)



