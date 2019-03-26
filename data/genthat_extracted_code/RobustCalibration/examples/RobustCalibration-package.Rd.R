library(RobustCalibration)


### Name: RobustCalibration-package
### Title: Robust Calibration of Imperfect Mathematical Models
### Aliases: RobustCalibration-package RobustCalibration
### Keywords: calibration emulation inverse problem model misspecification
###   prediction

### ** Examples


##---------------------------------------------------
##A simple example where the math model is not biased
##---------------------------------------------------
## the reality 
test_funct_eg1<-function(x){
  sin(pi/2*x)
}



## obtain 25 data from the reality plus a noise
set.seed(1)
## 10 data points are very small, one may want to add more data
n=15
input=seq(0,4,4/(n-1))
input=as.matrix(input)

output=test_funct_eg1(input)+rnorm(length(input),mean=0,sd=0.2)

## plot input and output 
#plot(input,output)
#num_obs=n=length(output)



## the math model 
math_model_eg1<-function(x,theta){
  sin(theta*x)  
}

##fit the S-GaSP model for the discrepancy
##one can choose the discrepancy_type to GaSP, S-GaSP or no discrepancy
##p_theta is the number of parameters to calibrate and user needs to specifiy 
##one may also want to change the number of posterior samples by change S and S_0
##one may change sd_proposal for the standard derivation of the proposal distribution
## one may also add a mean by setting X=... and have_trend=TRUE
model_sgasp=rcalibration(design=input, observations=output, p_theta=1,simul_type=1,
                         math_model=math_model_eg1,theta_range=matrix(c(0,3),1,2)
                         ,S=10000,S_0=2000,discrepancy_type='S-GaSP')


##posterior samples of calibration parameter and value
## the value is 
plot(model_sgasp@post_sample[,1],type='l',xlab='num',ylab=expression(theta))   
plot(model_sgasp@post_value,type='l',xlab='num',ylab='posterior value')   


show(model_sgasp)



#------------------------------------------------------------------------------
# Example: an example used in Susie Bayarri et. al. 2007 Technometrics paper
#------------------------------------------------------------------------------

##reality
test_funct_eg1<-function(x){
  3.5*exp(-1.7*x)+1.5
}


##math model
math_model_eg1<-function(x,theta){
  5*exp(-x*theta) 
}

## noise observations (sampled from reality + independent Gaussian noises)
## each has 3 replicates
input=c(rep(.110,3),rep(.432,3),rep(.754,3),rep(1.077,3),rep(1.399,3),rep(1.721,3),
        rep(2.043,3),rep(2.366,3),rep(2.688,3),rep(3.010,3))
output=c(4.730,4.720,4.234,3.177,2.966,3.653,1.970,2.267,2.084,2.079,2.409,2.371,1.908,1.665,1.685,
         1.773,1.603,1.922,1.370,1.661,1.757,1.868,1.505,1.638,1.390,1.275,1.679,1.461,1.157,1.530)


n_stack=length(output)/3
output_stack=rep(0,n_stack)
input_stack=rep(0,n_stack)
for(j in 1:n_stack){
  output_stack[j]=mean(output[ ((j-1)*3+1):(3*j)])
  input_stack[j]=mean(input[ ((j-1)*3+1):(3*j)])
  
}
output_stack=as.matrix(output_stack)
input_stack=as.matrix(input_stack)
## plot the output and stack
#plot(input,output,pch=16,col='red')
#lines(input_stack,output_stack,pch=16,col='blue',type='p')



## fit the model with S-GaSP for the discrepancy
model_sgasp=rcalibration(design=input_stack, observations=output_stack, p_theta=1,simul_type=1,
                         math_model=math_model_eg1,theta_range=matrix(c(0,10),1,2),S=10000,
                         S_0=2000,discrepancy_type='S-GaSP')

#posterior
plot(model_sgasp@post_sample[,1],type='l',xlab='num',ylab=expression(theta))   
show(model_sgasp)






