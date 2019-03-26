library(FastGaSP)


### Name: log_lik
### Title: Natural logarithm of profile likelihood by the fast computing
###   algorithm
### Aliases: log_lik

### ** Examples

library(FastGaSP)
#--------------------------------------------------------------------------
# Example 1: comparing the fast and slow algorithms to compute the likelihood 
# of the Gaussian stochastic process for data with noises
#--------------------------------------------------------------------------

y_R<-function(x){
  sin(2*pi*x)
}

###let's test for 1000 observations
set.seed(1)
num_obs=1000
input=runif(num_obs)
output=y_R(input)+rnorm(num_obs,mean=0,sd=0.1)

##constucting the fgasp.model
fgasp.model=fgasp(input, output)

##range and noise-variance ratio (nugget) parameters 
param=c( log(1),log(.02))
## the log lik
log_lik(param,fgasp.model)
##time cost to compute the likelihood
time_cost=system.time(log_lik(param,fgasp.model))
time_cost[1]

##now I am comparing to the one with straightforward inversion

matern_5_2_kernel<-function(d,beta){  
  res=(1+sqrt(5)*beta*d + 5*beta^2*d^2/3 )*exp(-sqrt(5)*beta*d)
  res
}

##A function for computing the likelihood by the GaSP in a straightforward way
log_lik_GaSP_slow<-function(param,have_noise=TRUE,input,output){
  n=length(output)
  beta=exp(param[1])
  eta=0
  if(have_noise){
    eta=exp(param[2])
  }
  R00=abs(outer(input,input,'-'))
  R=matern_5_2_kernel(R00,beta=beta)
  R_tilde=R+eta*diag(n)
  #use Cholesky and one backsolver and one forward solver so it is more stable
  L=t(chol(R_tilde))
  output_t_R.inv= t(backsolve(t(L),forwardsolve(L,output )))
  S_2=output_t_R.inv%*%output
  
  -sum(log(diag(L)))-n/2*log(S_2)
}



##range and noise-variance ratio (nugget) parameters 
param=c( log(1),log(.02))
## the log lik
log_lik(param,fgasp.model)
log_lik_GaSP_slow(param,have_noise=TRUE,input=input,output=output)

##time cost to compute the likelihood
##More number of inputs mean larger differences
time_cost=system.time(log_lik(param,fgasp.model))
time_cost

time_cost_slow=system.time(log_lik_GaSP_slow(param,have_noise=TRUE,input=input,output=output))
time_cost_slow


#--------------------------------------------------------------------------
# Example 2: comparing the fast and slow algorithms to compute the likelihood 
# of the Gaussian stochastic process for data without a noise
#--------------------------------------------------------------------------
## Here is a function in the Sobolev Space with order 3
y_R<-function(x){
  j_seq=seq(1,200,1)
  record_y_R=0
  for(i_j in 1:200){
    record_y_R=record_y_R+2*j_seq[i_j]^{-2*3}*sin(j_seq[i_j])*cos(pi*(j_seq[i_j]-0.5)*x)

  }
  record_y_R
}


##generate some data without noise
num_obs=50
input=seq(0,1,1/(num_obs-1))

output=y_R(input)


##constucting the fgasp.model
fgasp.model=fgasp(input, output,have_noise=FALSE)

##range and noise-variance ratio (nugget) parameters 
param=c( log(1))
## the log lik
log_lik(param,fgasp.model)
log_lik_GaSP_slow(param,have_noise=FALSE,input=input,output=output)





