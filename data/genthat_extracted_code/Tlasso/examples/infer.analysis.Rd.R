library(Tlasso)


### Name: infer.analysis
### Title: Inference Performance Measures
### Aliases: infer.analysis

### ** Examples


m.vec = c(5,5,5)  # dimensionality of a tensor 
n = 5   # sample size 
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
mat.list=list()
for ( k in 1:3) {
  rho=covres(DATA, out.tlasso, k = k) 
  # sample covariance of residuals, including diagnoal 
  varpi2=varcor(DATA, out.tlasso, k = k)
  # variance correction term for kth mode's sample covariance of residuals
  bias_rho=biascor(rho,out.tlasso,k=k)
  # bias corrected 
  
  tautest=matrix(0,m.vec[k],m.vec[k])
  for( i in 1:(m.vec[k]-1)) {
    for ( j in (i+1):m.vec[k]){
      tautest[j,i]=tautest[i,j]=sqrt((n-1)*prod(m.vec[-k]))*
        bias_rho[i,j]/sqrt(varpi2*rho[i,i]*rho[j,j])
    }
  }
  # list of matrices of test statistic values (off-diagnoal). See Sun et al. 2016
  mat.list[[k]]=tautest
}

infer.analysis(mat.list, qnorm(0.975), Omega.true.list, offdiag=TRUE)
# inference measures (off-diagnoal) 




