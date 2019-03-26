library(bnlearn)


### Name: lizards
### Title: Lizards' perching behaviour data set
### Aliases: lizards
### Keywords: datasets

### ** Examples

# load the data.
data(lizards)
# create and plot the network structure.
dag = model2network("[Species][Diameter|Species][Height|Species]")
## Not run: graphviz.plot(dag, shape = "ellipse")

# This data set is useful as it offers nominal values for
# the conditional mutual information and X^2 tests.
ci.test("Height", "Diameter", "Species", test = "mi", data = lizards)
ci.test("Height", "Diameter", "Species", test = "x2", data = lizards)



