library(ecospat)


### Name: ecospat.calculate.pd
### Title: Calculate Phylogenetic Diversity Measures
### Aliases: ecospat.calculate.pd

### ** Examples

fpath <- system.file("extdata", "ecospat.testTree.tre", package="ecospat")
tree <-read.tree(fpath)
data <- ecospat.testData[9:52] 

pd <- ecospat.calculate.pd(tree, data, method = "spanning", type = "species", root = FALSE, 
average = FALSE, verbose = TRUE )

plot(pd)



