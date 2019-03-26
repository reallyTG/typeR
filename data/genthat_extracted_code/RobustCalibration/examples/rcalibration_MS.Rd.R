library(RobustCalibration)


### Name: rcalibration_MS
### Title: Setting up the robust Calibration model for multiple sources
###   data
### Aliases: rcalibration_MS rcalibration_MS-method

### ** Examples

#------------------------------------------------------------------------------
# An example for calibrating mathematical models for data from multiple sources
#------------------------------------------------------------------------------

library(RobustCalibration)


##reality
test_funct<-function(x){
  sin(pi*x/2)+2*cos(pi*x/2)
}


##math model from two sources
math_model_source_1<-function(x,theta){
  sin(theta*x) 
}

math_model_source_2<-function(x,theta){
  cos(theta*x) 
}

input1=seq(0,2,2/(10-1))
input2=seq(0,3,3/(15-1))
##
output1=test_funct(input1)+rnorm(length(input1), sd=0.01)
output2=test_funct(input2)+rnorm(length(input2), sd=0.02)

plot(input1, output1)
plot(input2, output2)



design=list()
design[[1]]=as.matrix(input1)
design[[2]]=as.matrix(input2)

observations=list()
observations[[1]]=output1
observations[[2]]=output2


p_theta=1


theta_range=matrix(0,p_theta,2)
theta_range[1,]=c(0, 8)  
simul_type=c(1,1)

math_model=list()

math_model[[1]]=math_model_source_1
math_model[[2]]=math_model_source_2


## calibrating two mathematical models for these two sources
model_sgasp=rcalibration_MS(design=design, observations=observations, p_theta=1,
                            simul_type=simul_type,math_model=math_model,
                            theta_range=theta_range, 
                            S=10000,S_0=2000,
                            discrepancy_type=rep('S-GaSP',length(design)))

plot(model_sgasp@post_theta[,1],type='l')
mean(model_sgasp@post_theta[,1])





