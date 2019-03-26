library(bnlearn)


### Name: BF
### Title: Bayes factor between two network structures
### Aliases: BF
### Keywords: network scores structure learning

### ** Examples

data(learning.test)

dag1 = model2network("[A][B][F][C|B][E|B][D|A:B:C]")
dag2 = model2network("[A][C][B|A][D|A][E|D][F|A:C:E]")
BF(dag1, dag2, learning.test, score = "bds", iss = 1)



