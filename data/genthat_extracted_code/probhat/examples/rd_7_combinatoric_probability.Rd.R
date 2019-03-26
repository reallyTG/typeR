library(probhat)


### Name: rd_7_combinatoric_probability
### Title: Combinatoric Probability
### Aliases: comb.prob

### ** Examples

data (trees)
trees = as.matrix (trees)
npcdfmv.f = npcdfmv (trees)

summary (trees)

#approximate first and third quartiles
#marginal probabilities are approximately 0.5 each
a = c (11.05, 72, 19.40)
b = c (15.25, 80, 37.30)

#however, multivariate probability is not necessarily close to 0.5 ^ 3
comb.prob (npcdfmv.f, a, b)



