library(HMVD)


### Name: HMVD-package
### Title: Group Association Test using a Hidden Markov Model
### Aliases: HMVD-package
### Keywords: package

### ** Examples

#############################################################################
#### compute the p-value and do parameter estimation for continuous outcome 
n = 4000; m = 20
X = matrix(rnorm(n*m),n)
Y = rowMeans(X[,1:4])*.2 + rnorm(n)
HMVD(Y,X)$p.value #### approximate p-value

HMVD(Y,X,nperm.max = 20)$p.value.perm #### p-value based on permutations
#### in practice we would use more permutations

out = HMVD(Y,X,method='estimation')
round(out$prob,2) ###posterior probability
out$theta ### common effect size

#### compute the p-value and do parameter estimation for binary outcome 
n = 4000; m = 20
X = matrix(rnorm(n*m),n)
p = rowMeans(X[,1:4])*.4
Y = rbinom(n,1,p = exp(p)/(1+exp(p)))
HMVD(Y,X,model.type='D')$p.value #### approximate p-value

HMVD(Y,X,nperm.max = 20)$p.value.perm #### p-value based on permutations
#### in practice we would use more permutations

out = HMVD(Y,X,model.type='D',method='estimation')
round(out$prob,2) ###posterior probability
out$theta ### common effect size



