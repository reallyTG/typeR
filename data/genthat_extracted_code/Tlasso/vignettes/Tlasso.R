## ------------------------------------------------------------------------
library(Tlasso)

## ------------------------------------------------------------------------
m.vec = c(5,5,5)  # dimensionality of a tensor 
# m1, m2, m3
n = 5   # sample size 

Omega.true.list = list()
for (k in 1:length(m.vec)) {
  Omega.true.list[[k]] = ChainOmega(m.vec[k], sd = k)
}

Omega.true.list[[1]]

## ------------------------------------------------------------------------
Sigma.true.list = list()
for (k in 1:length(m.vec)) {
  Sigma.true.list[[k]] = solve(Omega.true.list[[k]])
} # generate covariance matrices list

DATA=Trnorm(n,m.vec,Sigma.list=Sigma.true.list) 
# obersavations from tensor normal distribution

## ---- eval=FALSE---------------------------------------------------------
#  DATA2=Trnorm(n,m.vec)
#  # default is triangle graph
#  # equivalent to DATA2 = Trnorm(n,m.vec, type='Chain', sd=1)
#  DATA3=Trnorm(n,m.vec,type='Neighbor')
#  # 4 nearest-neighbor graph
#  # equivalent to DATA3 = Trnorm(n,m.vec, type='Neighbor', sd=1, knn=4)

## ------------------------------------------------------------------------
lambda.thm = 20*c( sqrt(log(m.vec[1])/(n*prod(m.vec))), 
                   sqrt(log(m.vec[2])/(n*prod(m.vec))), 
                   sqrt(log(m.vec[3])/(n*prod(m.vec))))
# lambda.thm is regularization parameter
out.tlasso = Tlasso.fit(DATA,T=1,lambda.vec = lambda.thm)   
# output is a list of estimation of precision matrices
out.tlasso[[1]]

## ------------------------------------------------------------------------
# compare out.tlasso and Omega.true.list
# main diagnoal is taken into consideration
est.analysis(out.tlasso,Omega.true.list,offdiag=FALSE)

## ------------------------------------------------------------------------
mat.list=list() # list of matrices of test statistic value  
for ( k in 1:length(m.vec)) {
  rho=covres(DATA, out.tlasso, k = k) 
  # sample covariance matrix of residuals, including diagnoal 
  bias_rho=biascor(rho,out.tlasso,k=k)
  # bias corrected sample covariance of residuals, excluding diagnoal
  
  varpi2=varcor(DATA, out.tlasso, k = k)
  # variance correction term for kth mode's sample covariance of residuals

  tautest=matrix(0,m.vec[k],m.vec[k])
  for( i in 1:(m.vec[k]-1)) {
    for ( j in (i+1):m.vec[k]){
      tautest[j,i]=tautest[i,j]=sqrt((n-1)*prod(m.vec[-k]))*
                      bias_rho[i,j]/sqrt(varpi2*rho[i,i]*rho[j,j])
      # compute final test statistic 
    }
  }
  
  mat.list[[k]]=tautest
}
mat.list[[1]]

## ------------------------------------------------------------------------
# inference measures (off-diagnoal), critical value is 0.975 quantile of standard normal
infer.analysis(mat.list, qnorm(0.975), Omega.true.list, offdiag=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  k=1 # interested mode
#  upsilon=0.1  # control level
#  
#  # compute the difference between FDP and upsilon
#  fun=function(varsigma,mk,upsilon,tautest) {
#    return((2*(1-pnorm(varsigma))*mk*(mk-1))/max(1,sum(sign(abs(tautest) > varsigma))) - upsilon)
#  }
#  
#  # select a critical value in (0,6) that has the samllest difference
#  diff=c();ind=1;inter=seq(0,6,0.0001)
#  for (varsigma in inter) {
#      diff[ind]=fun(varsigma,mk=m.vec[k],upsilon=upsilon,tautest=mat.list[[k]])
#      ind=ind+1
#  }
#  # the smallest critical value that constrains FDP under upsilon
#  critical=inter[min(which(diff < 0))]
#  
#  # testing hypothesis with the critcal value
#  # FDR will converge to the limit proved in Sun et al. 2016
#  inference.FDR=infer.analysis(mat.list, critical, Omega.true.list, offdiag=TRUE)

## ---- fig.height=5 , fig.width=5, fig.align='center'---------------------
k=1 # interested mode
# true graph structure. 
# set thres=0 in case true edge is eliminated
graph.pattern(Omega.true.list[[1]],main='True graph of mode 1',thres=0)

inf.mat=mat.list[[k]] > qnorm(0.975)
# set thres=0 (<1) since inf.mat is logical
graph.pattern(inf.mat,main='Inference of mode 1',thres=0)

