library(Tlasso)


### Name: est.analysis
### Title: Estimation Errors and TPR/TNR
### Aliases: est.analysis

### ** Examples


m.vec = c(5,5,5)  # dimensionality of a tensor 
n = 5   # sample size 
k=1 # index of interested mode
Omega.true.list = list()
Omega.true.list[[1]] = ChainOmega(m.vec[1], sd = 1)
Omega.true.list[[2]] = ChainOmega(m.vec[2], sd = 2)
Omega.true.list[[3]] = ChainOmega(m.vec[3], sd = 3)
lambda.thm = 20*c( sqrt(log(m.vec[1])/(n*prod(m.vec))), 
                   sqrt(log(m.vec[2])/(n*prod(m.vec))), 
                   sqrt(log(m.vec[3])/(n*prod(m.vec))))
DATA=Trnorm(n,m.vec,type='Chain') 
# obersavations from tensor normal distribution
out.tlasso = Tlasso.fit(DATA,T=1,lambda.vec = lambda.thm)   
# output is a list of estimation of precision matrices
est.analysis(out.tlasso, Omega.true.list, offdiag=TRUE)
# generate a list of performance measures




