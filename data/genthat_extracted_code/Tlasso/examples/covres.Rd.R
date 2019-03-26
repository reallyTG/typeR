library(Tlasso)


### Name: covres
### Title: Sample Covariance Matrix of Residuals
### Aliases: covres

### ** Examples


m.vec = c(5,5,5)  # dimensionality of a tensor 
n = 5   # sample size 
k=1 # index of interested mode
lambda.thm = 20*c( sqrt(log(m.vec[1])/(n*prod(m.vec))), 
                   sqrt(log(m.vec[2])/(n*prod(m.vec))), 
                   sqrt(log(m.vec[3])/(n*prod(m.vec))))
DATA=Trnorm(n,m.vec,type='Chain') 
# obersavations from tensor normal distribution
out.tlasso = Tlasso.fit(DATA,T=1,lambda.vec = lambda.thm)   
# output is a list of estimation of precision matrices
rho=covres(DATA, out.tlasso, k = k) # sample covariance of residuals, including diagnoal 
rho




