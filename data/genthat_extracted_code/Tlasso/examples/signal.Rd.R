library(Tlasso)


### Name: signal
### Title: Regression Parameter of Conditional Linear Model
### Aliases: signal

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
signal(out.tlasso, i=2 , k=k )
# the regression parameter for conditional linear model of 2rd row in 1st mode




