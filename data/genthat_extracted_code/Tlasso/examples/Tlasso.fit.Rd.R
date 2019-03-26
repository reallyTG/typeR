library(Tlasso)


### Name: Tlasso.fit
### Title: Non-Convex Optimization for Sparse Tensor Graphical Models
### Aliases: Tlasso.fit

### ** Examples


m.vec = c(5,5,5)  # dimensionality of a tensor 
n = 5   # sample size 
lambda.thm = 20*c( sqrt(log(m.vec[1])/(n*prod(m.vec))), 
                  sqrt(log(m.vec[2])/(n*prod(m.vec))), 
                  sqrt(log(m.vec[3])/(n*prod(m.vec))))
DATA=Trnorm(n,m.vec,type='Chain') 
# obersavations from tensor normal distribution
out.tlasso = Tlasso.fit(DATA,T=10,lambda.vec = lambda.thm,thres=10)   
# terminate by thres
out.tlasso = Tlasso.fit(DATA,T=3,lambda.vec = lambda.thm,thres=0)   
# thres=0, iterate 10 times





