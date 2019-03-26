library(bayesm)


### Name: ghkvec
### Title: Compute GHK approximation to Multivariate Normal Integrals
### Aliases: ghkvec
### Keywords: distribution

### ** Examples

Sigma = matrix(c(1, 0.5, 0.5, 1), ncol=2)
L = t(chol(Sigma))
trunpt = c(0,0,1,1)
above = c(1,1) 
# here we have a two dimensional integral with two different truncation points
#    (0,0) and (1,1)
# however, there is only one vector of "above" indicators for each integral
#     above=c(1,1) is applied to both integrals.  

# drawn by Halton sequence
ghkvec(L, trunpt, above, r=100)

# use prime number 11 and 13
ghkvec(L, trunpt, above, r=100, HALTON=TRUE, pn=c(11,13))

# drawn by R::runif
ghkvec(L, trunpt, above, r=100, HALTON=FALSE)



