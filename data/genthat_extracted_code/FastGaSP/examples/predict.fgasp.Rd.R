library(FastGaSP)


### Name: predict
### Title: Prediction and uncertainty quantification on the testing input
###   using a GaSP model.
### Aliases: predict predict.fgasp predict,fgasp-method

### ** Examples


library(FastGaSP)

#------------------------------------------------------------------------------
# Example 1: a simple example with noise to show fast computation algorithm 
#------------------------------------------------------------------------------

y_R<-function(x){
  cos(2*pi*x)
}

###let's test for 2000 observations
set.seed(1)
num_obs=2000
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

##consider a nonparametric regression setting 
##estimate the parameter by maximum likelihood estimation

est_all<-optim(c(log(1),log(.02)),log_lik,object=fgasp.model,method="L-BFGS-B",
              control = list(fnscale=-1))  

##estimated log inverse range parameter and log nugget
est_all$par

##estimate variance 
est.var=Get_log_det_S2(est_all$par,fgasp.model@have_noise,fgasp.model@delta_x,
                          fgasp.model@output)[[2]]/fgasp.model@num_obs
est.var

###1. Do some interpolation test 
num_test=5000
testing_input=runif(num_test) ##there are the input where you don't have observations
pred.model=predict(param=est_all$par,object=fgasp.model,testing_input=testing_input)

lb=pred.model@mean+qnorm(0.025)*sqrt(pred.model@var)
ub=pred.model@mean+qnorm(0.975)*sqrt(pred.model@var)

## calculate lb for the mean function
pred.model2=predict(param=est_all$par,object=fgasp.model,testing_input=testing_input,var_data=FALSE)
lb_mean_funct=pred.model2@mean+qnorm(0.025)*sqrt(pred.model2@var)
ub_mean_funct=pred.model2@mean+qnorm(0.975)*sqrt(pred.model2@var)

## plot the prediction
min_val=min(lb,output)
max_val=max(ub,output)

plot(pred.model@testing_input,pred.model@mean,type='l',col='blue',
     ylim=c(min_val,max_val),
     xlab='x',ylab='y')
polygon( c(pred.model@testing_input,rev(pred.model@testing_input)),
    c(lb,rev(ub)),col = "grey80", border = FALSE)
lines(pred.model@testing_input,pred.model@mean,type='l',col='blue')
lines(pred.model@testing_input,y_R(pred.model@testing_input),type='l',col='black')
lines(pred.model2@testing_input,lb_mean_funct,col='blue',lty=2)
lines(pred.model2@testing_input,ub_mean_funct,col='blue',lty=2)
lines(input,output,type='p',pch=16,col='black',cex=0.4) #one can plot data

legend("bottomleft", legend=c("predictive mean","95% predictive interval","truth"),
       col=c("blue","blue","black"), lty=c(1,2,1), cex=.8)


##mean square error for all inputs
mean((pred.model@mean- y_R(pred.model@testing_input))^2)
##coverage for the mean
length(which(y_R(pred.model@testing_input)>lb_mean_funct &
               y_R(pred.model@testing_input)<ub_mean_funct))/pred.model@num_testing
##average length of the invertal for the mean
mean(abs(ub_mean_funct-lb_mean_funct))
##average length of the invertal for the data
mean(abs(ub-lb))

#---------------------------------------------------------------------------------
# Example 2: numerical comparison with the GaSP by inverting the covariance matrix
#---------------------------------------------------------------------------------
##matern correlation with smoothness parameter being 2.5
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


pred_GaSP_slow<-function(param,have_noise=TRUE,input,output,testing_input){
  beta=exp(param[1])
  R00=abs(outer(input,input,'-'))
  eta=0
  if(have_noise){
    eta=exp(param[2])
  }
  R=matern_5_2_kernel(R00,beta=beta)
  R_tilde=R+eta*diag(length(output))
  
  ##I invert it here but one can still use cholesky to make it more stable
  R_tilde_inv=solve(R_tilde)

  r0=abs(outer(input,testing_input,'-'))
  r=matern_5_2_kernel(r0,beta=beta)

  S_2=t(output)%*%(R_tilde_inv%*%output)

  sigma_2_hat=as.numeric(S_2/num_obs)

  pred_mean=t(r)%*%(R_tilde_inv%*%output)
  pred_var=rep(0,length(testing_input))
  
  
  for(i in 1:length(testing_input)){
    pred_var[i]=-t(r[,i])%*%R_tilde_inv%*%r[,i]
  }
  pred_var=pred_var+1+eta
  list=list()
  list$mean=pred_mean
  list$var=pred_var*sigma_2_hat
  list
}

##let's test sin function
y_R<-function(x){
  sin(2*pi*x)
}


###let's test for 800 observations
set.seed(1)
num_obs=800
input=runif(num_obs)
output=y_R(input)+rnorm(num_obs,mean=0,sd=0.1)


##constucting the fgasp.model
fgasp.model=fgasp(input, output)

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

est_all<-optim(c(log(1),log(.02)),log_lik,object=fgasp.model,method="L-BFGS-B",
              control = list(fnscale=-1))  
##estimated log inverse range parameter and log nugget
est_all$par


##Do some interpolation test for comparison
num_test=200
testing_input=runif(num_test) ##there are the input where you don't have observations


## two ways of prediction
pred.model=predict(param=est_all$par,object=fgasp.model,testing_input=testing_input)
pred_slow=pred_GaSP_slow(param=est_all$par,have_noise=TRUE,input,output,sort(testing_input))
## look at the difference
max(abs(pred.model@mean-pred_slow$mean))
max(abs(pred.model@var-pred_slow$var))





