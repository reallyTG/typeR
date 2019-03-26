library(poLCA)


### Name: poLCA.entropy
### Title: Entropy of a fitted latent class model
### Aliases: poLCA.entropy
### Keywords: methods

### ** Examples

data(carcinoma)
f <- cbind(A,B,C,D,E,F,G)~1
lca2 <- poLCA(f,carcinoma,nclass=2) # log-likelihood: -317.2568
lca3 <- poLCA(f,carcinoma,nclass=3) # log-likelihood: -293.705
lca4 <- poLCA(f,carcinoma,nclass=4,nrep=10,maxiter=5000) # log-likelihood: -289.2858 

# Maximum entropy (if all cases equally dispersed)
log(prod(sapply(lca2$probs,ncol)))

# Sample entropy ("plug-in" estimator, or MLE)
p.hat <- lca2$predcell$observed/lca2$N
H.hat <- -sum(p.hat * log(p.hat))
H.hat   # 2.42

# Entropy of fitted latent class models
poLCA.entropy(lca2)
poLCA.entropy(lca3)
poLCA.entropy(lca4)



