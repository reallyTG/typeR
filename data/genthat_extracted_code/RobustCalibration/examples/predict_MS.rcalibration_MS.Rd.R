library(RobustCalibration)


### Name: predict_MS
### Title: Prediction for the robust calibration model for multiple sources
### Aliases: predict_MS predict_MS.rcalibration_MS
###   predict_MS,rcalibration_MS-method

### ** Examples

#---------------------------------------------------------------------------------------------
# An example for calibrating and predicting mathematical models for data from multiple sources
#---------------------------------------------------------------------------------------------
    


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
input2=seq(0,3,3/(10-1))
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

#plot(model_sgasp@post_theta[,1],type='l')
mean(model_sgasp@post_theta[,1])

testing_input1=seq(0,2,2/(25-1))

testing_input2=seq(0,3,3/(25-1))

testing_input=list()
testing_input[[1]]=as.matrix(testing_input1)
testing_input[[2]]=as.matrix(testing_input2)


predict_sgasp=predict_MS(model_sgasp, testing_input, math_model=math_model)
  

testing_output1=test_funct(testing_input1)
testing_output2=test_funct(testing_input2)


plot(predict_sgasp@mean[[1]])
lines(testing_output1)

plot(predict_sgasp@mean[[2]])
lines(testing_output2)






