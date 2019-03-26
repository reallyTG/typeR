library(poLCA)


### Name: carcinoma
### Title: Diagnoses of carcinoma (sample data)
### Aliases: carcinoma
### Keywords: datasets

### ** Examples

##
## Replication of latent class models in Agresti (2002, p. 543), 
## Table 13.2 and Table 13.3.
##
data(carcinoma)
f <- cbind(A,B,C,D,E,F,G)~1
lca2 <- poLCA(f,carcinoma,nclass=2) # log-likelihood: -317.2568
lca3 <- poLCA(f,carcinoma,nclass=3) # log-likelihood: -293.705
lca4 <- poLCA(f,carcinoma,nclass=4,nrep=10,maxiter=5000) # log-likelihood: -289.2858 



