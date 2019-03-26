library(poLCA)


### Name: poLCA.predcell
### Title: Predicted cell percentages in a latent class model
### Aliases: poLCA.predcell
### Keywords: methods

### ** Examples

data(carcinoma)
f <- cbind(A,B,C,D,E,F,G)~1
lca3 <- poLCA(f,carcinoma,nclass=3) # log-likelihood: -293.705

# Only 20 out of 32 possible response patterns are observed
lca3$predcell

# Produce cell probabilities for one sequence of responses
poLCA.predcell(lc=lca3,y=c(1,1,1,1,1,1,1))

# Estimated probabilities for a cell with zero observations
poLCA.predcell(lc=lca3,y=c(1,1,1,1,1,1,2))

# Cell probabilities for both cells at once; y entered as a matrix
poLCA.predcell(lc=lca3,y=rbind(c(1,1,1,1,1,1,1),c(1,1,1,1,1,1,2)))



