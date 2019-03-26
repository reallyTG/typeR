library(poLCA)


### Name: values
### Title: Universalistic vs. particularistic values (sample data)
### Aliases: values
### Keywords: datasets

### ** Examples

##
## Replication of latent class models in Goodman (2002), 
## Tables 5b, 5c, and 6.
##
data(values)
f <- cbind(A,B,C,D)~1
M0 <- poLCA(f,values,nclass=1) # log-likelihood: -543.6498
M1 <- poLCA(f,values,nclass=2) # log-likelihood: -504.4677
M2 <- poLCA(f,values,nclass=3,maxiter=8000) # log-likelihood: -503.3011



