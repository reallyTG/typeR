library(RobustCalibration)


### Name: rcalibration
### Title: Setting up the robust Calibration model
### Aliases: rcalibration rcalibration-method

### ** Examples

library(RobustCalibration)

#-------------------------------------------------------------
# an example with multiple local maximum of minimum in L2 loss
#-------------------------------------------------------------

## the reality 
test_funct_eg1<-function(x){
  x*cos(3/2*x)+x
}



## obtain 25 data from the reality plus a noise
set.seed(1)
## 10 data points are very small, one may want to add more data
n=15
input=seq(0,5,5/(n-1))
input=as.matrix(input)

output=test_funct_eg1(input)+rnorm(length(input),mean=0,sd=0.1)

num_obs=n=length(output)



## the math model 
math_model_eg1<-function(x,theta){
  sin(theta*x)+x  
}

##fit the S-GaSP model for the discrepancy
##one can choose the discrepancy_type to GaSP, S-GaSP or no discrepancy
##p_theta is the number of parameters to calibrate and user needs to specifiy 
##one may also want to change the number of posterior samples by change S and S_0
p_theta=1
model_sgasp=rcalibration(design=input, observations=output, p_theta=p_theta,simul_type=1,
                         math_model=math_model_eg1,theta_range=matrix(c(0,3),1,2)
                         ,S=10000,S_0=2000,discrepancy_type='S-GaSP')

##if the acceptance rate is too low or two high, one can adjust sd_proposal, e.g.
#model_sgasp=rcalibration(design=input, observations=output, p_theta=1,simul_type=1,
#                         sd_proposal=c(rep(0.02,p_theta),rep(0.2,dim(input)[2]),0.2)
#                         math_model=math_model_eg1,theta_range=matrix(c(0,3),1,2)
#                         ,S=10000,S_0=2000,discrepancy_type='S-GaSP')

##posterior samples of calibration parameter and value
plot(model_sgasp@post_sample[,1],type='l',xlab='num',ylab=expression(theta))   
plot(model_sgasp@post_value,type='l',xlab='num',ylab='posterior value')   


show(model_sgasp)




##one may want to fit a a model with an estimated baseline mean discrepancy by setting 
##X=matrix(1,dim(input_stack)[1],1),have_trend=TRUE

model_sgasp_with_mean=rcalibration(design=input, observations=output, p_theta=1,simul_type=1,
                                   X=matrix(1,dim(input)[1],1),have_trend=TRUE,
                                   math_model=math_model_eg1,theta_range=matrix(c(0,3),1,2),
                                   S=10000,S_0=2000,discrepancy_type='S-GaSP')

show(model_sgasp_with_mean)

##posterior samples of calibration parameter and value
plot(model_sgasp_with_mean@post_sample[,1],type='l',xlab='num',ylab=expression(theta))   
plot(model_sgasp_with_mean@post_value,type='l',xlab='num',ylab='posterior value')   


## Not run: 
##D   #-------------------------------------------------------------
##D   # an example with multiple local maximum of minimum in L2 loss
##D   # for combing the emulator
##D   #-------------------------------------------------------------
##D   
##D   ## the reality 
##D   test_funct_eg1<-function(x){
##D     x*cos(3/2*x)+x
##D   }
##D   
##D   ## obtain 20 data from the reality plus a noise
##D   set.seed(1)
##D   n=20
##D   input=seq(0,5,5/(n-1))
##D   input=as.matrix(input)
##D   
##D   output=test_funct_eg1(input)+rnorm(length(input),mean=0,sd=0.05)
##D   
##D   num_obs=n=length(output)
##D   
##D   ## the math model 
##D   math_model_eg1<-function(x,theta){
##D     sin(theta*x)+x  
##D   }
##D   
##D   ##let's build an emulator for the case if the math model is too slow
##D   
##D   # let's say we can only run the math model n_design times
##D   n_design=80
##D   
##D   design_simul=matrix(runif(n_design*2),n_design,2)
##D   design_simul[,1]=5*design_simul[,1]   ##the first one is the observed input x
##D   design_simul[,2]=3*design_simul[,2]   ##the second one is the calibration parameter 
##D   
##D   output_simul=math_model_eg1(design_simul[,1],design_simul[,2])
##D   
##D   
##D   
##D   ##this is a little slow compared with the previous model
##D   model_sgasp_emulator=rcalibration(design=input, observations=output, p_theta=1,simul_type=0, 
##D                                     input_simul=design_simul, output_simul=output_simul,
##D                                     theta_range=matrix(c(0,3),1,2),
##D                                     S=10000,S_0=2000,discrepancy_type='S-GaSP')
##D   
##D   ##now the output is a list
##D   show(model_sgasp_emulator)
##D 
##D   ##here is the plot
##D   plot(model_sgasp_emulator@post_sample[,1],type='l',xlab='num',ylab=expression(theta))   
##D   plot(model_sgasp_emulator@post_value,type='l',xlab='num',ylab='posterior value')   
## End(Not run)






