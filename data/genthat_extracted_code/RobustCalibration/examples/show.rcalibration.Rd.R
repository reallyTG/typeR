library(RobustCalibration)


### Name: show
### Title: Show an Robust Calibration object.
### Aliases: show show.rcalibration show.rcalibration-class
###   show,rcalibration-method

### ** Examples


##-------------------------------------------------
#A simple example where the math model is not biased
##-------------------------------------------------
## the reality 
test_funct_eg1<-function(x){
  sin(pi/2*x)
}



## obtain 15 data from the reality plus a noise
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


#-------------------------------------------------------------
# an example with multiple local maximum of minimum in L2 loss
#-------------------------------------------------------------

## the reality 
test_funct_eg1<-function(x){
  x*cos(3/2*x)+x
}



## obtain 15 data from the reality plus a noise
set.seed(1)
n=15
input=seq(0,5,5/(n-1))
input=as.matrix(input)

output=test_funct_eg1(input)+rnorm(length(input),mean=0,sd=0.05)

num_obs=n=length(output)


## the math model 
math_model_eg1<-function(x,theta){
  sin(theta*x)+x  
}

## fit the S-GaSP model for the discrepancy

model_sgasp=rcalibration(design=input, observations=output, p_theta=1,simul_type=1,
                         math_model=math_model_eg1,theta_range=matrix(c(0,3),1,2),
                         discrepancy_type='S-GaSP')


## posterior samples 
plot(model_sgasp@post_sample[,1],type='l',xlab='num',ylab=expression(theta))   
show(model_sgasp)




