library(ggm)


### Name: derived
### Title: Data on blood pressure body mass and age
### Aliases: derived
### Keywords: datasets

### ** Examples

# A DAG model with a latent variable U
G = DAG(Y ~ Z + U, X ~ U + W, Z ~ W)

data(derived)

# The model fitted using the derived variables
out = fitDagLatent(G, derived$S, n = 44, latent = "U")

# An ancestral graph model marginalizing over U
H = AG(G, M = "U")

# The ancestral graph model fitted obtaining the 
# same result
out2 = fitAncestralGraph(H, derived$S, n = 44)



