library(RobustCalibration)


### Name: predict
### Title: Prediction for the robust calibration model
### Aliases: predict predict.rcalibration predict,rcalibration-method

### ** Examples

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


## calculating the average or the stack data
n_stack=length(output)/3
output_stack=rep(0,n_stack)
input_stack=rep(0,n_stack)
for(j in 1:n_stack){
  output_stack[j]=mean(output[ ((j-1)*3+1):(3*j)])
  input_stack[j]=mean(input[ ((j-1)*3+1):(3*j)])
}
output_stack=as.matrix(output_stack)
input_stack=as.matrix(input_stack)
## plot the output and stack output
#plot(input,output,pch=16,col='red')
#lines(input_stack,output_stack,pch=16,col='blue',type='p')



## fit model using S-GaSP for the discrepancy
## one can change S and S_0 for the number of posterior and burn-in samples
## Normallly you may need a larger number of posterior sample
## you can set S=50000 and S_0=5000
## one may also change the sd of the proposal distribution using sd_proposal
model_sgasp=rcalibration(design=input_stack, observations=output_stack, p_theta=1,simul_type=1,
                         math_model=math_model_eg1,theta_range=matrix(c(0,10),1,2),
                         S=10000,S_0=2000,discrepancy_type='S-GaSP')

# one can  fit the GaSP model for discrepancy function by discrepancy_type='GaSP'
# one can  fit a model without the discrepancy function by discrepancy_type='no-discrepancy'

## posterior of the calibration parameter
#plot(model_sgasp@post_sample[,1],type='l',xlab='num',ylab=expression(theta))   
show(model_sgasp)

##

## test data set
testing_input=as.matrix(seq(0,6,0.02))

##perform prediction
prediction_sgasp=predict(model_sgasp,testing_input,math_model=math_model_eg1,
                         interval_est=c(0.025,0.975),interval_data=TRUE,
                         n_thinning =20 )

##real test output
testing_output=test_funct_eg1(testing_input)

##the prediction by S-GaSP
min_val=min(prediction_sgasp@mean,prediction_sgasp@interval,output,testing_output)
max_val=max(prediction_sgasp@mean,prediction_sgasp@interval,output,testing_output)

plot(testing_input,prediction_sgasp@mean,type='l',col='blue',xlab='x',ylab='y',
     ylim=c(min_val,max_val) )
lines(testing_input,prediction_sgasp@interval[,1],col='blue',lty=2)
lines(testing_input,prediction_sgasp@interval[,2],col='blue',lty=2)

lines(input,output,type='p')
lines(testing_input,prediction_sgasp@math_model_mean,col='blue',lty=3)

lines(testing_input,testing_output,type='l')

legend("topright", legend=c("reality", "predictive mean","95 percent posterior credible interval",
                            "predictive mean of the math model"),
                            col=c("black", "blue","blue","blue"), lty=c(1,1,2,3),cex=.6)


## MSE if the math model and discrepancy are used for prediction
mean((testing_output-prediction_sgasp@mean)^2)

## MSE if the math model is used for prediction 
mean((testing_output-prediction_sgasp@math_model_mean)^2)



##################################
#the example with a mean structure
##################################

##now let's fit  model with mean
model_sgasp_with_mean=rcalibration(design=input_stack, observations=output_stack,
                                   p_theta=1,X=matrix(1,dim(input_stack)[1],1),
                                   have_trend=TRUE,simul_type=1,
                                   math_model=math_model_eg1,
                                   theta_range=matrix(c(0,10),1,2),
                                   S=10000,S_0=2000,
                                   discrepancy_type='S-GaSP')

#posterior
#plot(model_sgasp_with_mean@post_sample[,1],type='l',xlab='num',ylab=expression(theta))   
show(model_sgasp_with_mean)


## test data set
testing_input=as.matrix(seq(0,6,0.02))


##in this way we don't output the interval estimation
## one can have interval using interval_est=c(0.025,0.975),interval_data=TRUE
prediction_sgasp_with_mean=predict(model_sgasp_with_mean,testing_input,
                                   X_testing=matrix(1,dim(testing_input)[1],1),
                                   math_model=math_model_eg1,n_thinning = 20)


##plot for the S-GaSP 
##for this example, with a mean structure, it fits much better
min_val=min(prediction_sgasp_with_mean@mean,output,testing_output)
max_val=max(prediction_sgasp_with_mean@mean,output,testing_output)

plot(testing_input,prediction_sgasp_with_mean@mean,type='l',col='blue',xlab='x',
     ylab='y',ylim=c(min_val,max_val) )
#lines(testing_input,prediction_sgasp_with_mean@interval[,1],col='blue',lty=2)
#lines(testing_input,prediction_sgasp_with_mean@interval[,2],col='blue',lty=2)

lines(input,output,type='p')
lines(testing_input,prediction_sgasp_with_mean@math_model_mean,col='blue',lty=3)

lines(testing_input,testing_output,type='l')

legend("topright", legend=c("reality", "predictive mean", "predictive mean of the math model"),
       col=c("black", "blue","blue"), lty=c(1,1,3),cex=.6)


## MSE if the math model and discrepancy are used for prediction
mean((testing_output-prediction_sgasp_with_mean@mean)^2)

## MSE if the math model is used for prediction 
mean((testing_output-prediction_sgasp_with_mean@math_model_mean)^2)

## Not run: 
##D   #-------------------------------------------------------------
##D   #the example with the emulator
##D   #-------------------------------------------------------------
##D   
##D   n_design=80
##D   
##D   design_simul=matrix(runif(n_design*2),n_design,2)
##D   #library(lhs)
##D   #design_simul=maximinLHS(n=n_design,k=2)
##D   
##D   design_simul[,1]=6*design_simul[,1]   ##the first one is the observed input x
##D   design_simul[,2]=10*design_simul[,2]   ##the second one is the calibration parameter \theta
##D   
##D   output_simul=math_model_eg1(design_simul[,1],design_simul[,2])
##D   
##D   
##D   ##this is a little slow compared with the previous model
##D   
##D   model_sgasp_with_mean_emulator=rcalibration(design=input_stack, observations=output_stack,
##D                                               p_theta=1,simul_type=0, 
##D                                               have_trend=T,X=matrix(1,dim(input_stack)[1],1),
##D                                               input_simul=design_simul, output_simul=output_simul,
##D                                               theta_range=matrix(c(0,10),1,2),
##D                                               S=10000,S_0=2000,discrepancy_type='S-GaSP')
##D   
##D   ##now the output is a list
##D   show(model_sgasp_with_mean_emulator)
##D   
##D   ##here is the plot
##D   plot(model_sgasp_with_mean_emulator@post_sample[,4],type='l',xlab='num',ylab=expression(theta))   
##D   plot(model_sgasp_with_mean_emulator@post_value,type='l',xlab='num',ylab='posterior value')   
##D   
##D   
##D   prediction_sgasp_with_mean_emulator=predict(model_sgasp_with_mean_emulator,testing_input,
##D                                               X_testing=matrix(1,dim(testing_input)[1],1),
##D                                               interval_est=c(0.025,0.975),
##D                                               interval_data=TRUE)
##D   
##D   ##for this example, with a mean structure, it fits much better
##D   min_val=min(prediction_sgasp_with_mean_emulator@mean,output,testing_output,
##D               prediction_sgasp_with_mean_emulator@math_model_mean)
##D   max_val=max(prediction_sgasp_with_mean_emulator@mean,output,testing_output,
##D               prediction_sgasp_with_mean_emulator@math_model_mean)
##D   
##D   plot(testing_input,prediction_sgasp_with_mean_emulator@mean,type='l',col='blue',xlab='x',
##D        ylab='y',ylim=c(min_val,max_val) )
##D   #lines(testing_input,prediction_sgasp_with_mean@interval[,1],col='blue',lty=2)
##D   #lines(testing_input,prediction_sgasp_with_mean@interval[,2],col='blue',lty=2)
##D   
##D   lines(input,output,type='p')
##D   lines(testing_input,prediction_sgasp_with_mean_emulator@math_model_mean,col='blue',lty=3)
##D   
##D   lines(testing_input,testing_output,type='l')
##D   
##D   legend("topright", legend=c("reality", "predictive mean", "predictive mean of the math model"),
##D          col=c("black", "blue","blue"), lty=c(1,1,3),cex=.6)
##D   
##D   
##D   ## MSE if the math model and discrepancy are used for prediction
##D   mean((testing_output-prediction_sgasp_with_mean_emulator@mean)^2)
##D   
##D   ## MSE if the math model is used for prediction 
##D   mean((testing_output-prediction_sgasp_with_mean_emulator@math_model_mean)^2)
##D 
## End(Not run)





