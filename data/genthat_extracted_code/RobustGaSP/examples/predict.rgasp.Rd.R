library(RobustGaSP)


### Name: predict
### Title: Prediction for Robust GaSP model
### Aliases: predict predict.rgasp predict.rgasp-class predict,rgasp-method

### ** Examples

  #------------------------
  # a 3 dimensional example
  #------------------------
  # dimensional of the inputs
  dim_inputs <- 3    
  # number of the inputs
  num_obs <- 30       
  # uniform samples of design
  input <- matrix(runif(num_obs*dim_inputs), num_obs,dim_inputs) 
  
  # Following codes use maximin Latin Hypercube Design, which is typically better than uniform
  # library(lhs)
  # input <- maximinLHS(n=num_obs, k=dim_inputs)  ##maximin lhd sample
  
  # outputs from the 3 dim dettepepel.3.data function
  
  output = matrix(0,num_obs,1)
  for(i in 1:num_obs){
    output[i]<-dettepepel.3.data (input[i,])
  }
  
  # use constant mean basis, with no constraint on optimization
  m1<- rgasp(design = input, response = output, lower_bound=FALSE)
  
  # the following use constraints on optimization
  # m1<- rgasp(design = input, response = output, lower_bound=TRUE)
  
  # the following use a single start on optimization
  # m1<- rgasp(design = input, response = output, lower_bound=FALSE, multiple_starts=FALSE)
  
  # number of points to be predicted 
  num_testing_input <- 5000    
  # generate points to be predicted
  testing_input <- matrix(runif(num_testing_input*dim_inputs),num_testing_input,dim_inputs)
  # Perform prediction
  m1.predict<-predict(m1, testing_input)
  # Predictive mean
  m1.predict$mean  
  
  # The following tests how good the prediction is 
  testing_output <- matrix(0,num_testing_input,1)
  for(i in 1:num_testing_input){
    testing_output[i]<-dettepepel.3.data(testing_input[i,])
  }
  
  # compute the MSE, average coverage and average length
  # out of sample MSE
  MSE_emulator <- sum((m1.predict$mean-testing_output)^2)/(num_testing_input)  
  
  # proportion covered by 95% posterior predictive credible interval
  prop_emulator <- length(which((m1.predict$lower95<=testing_output)
                   &(m1.predict$upper95>=testing_output)))/num_testing_input
  
  # average length of  posterior predictive credible interval
  length_emulator <- sum(m1.predict$upper95-m1.predict$lower95)/num_testing_input
  
  # output of prediction
  MSE_emulator
  prop_emulator
  length_emulator  
  # normalized RMSE
  sqrt(MSE_emulator/mean((testing_output-mean(output))^2 ))


  #-----------------------------------
  # a 2 dimensional example with trend
  #-----------------------------------
  # dimensional of the inputs
  dim_inputs <- 2    
  # number of the inputs
  num_obs <- 20       
  
  # uniform samples of design
  input <-matrix(runif(num_obs*dim_inputs), num_obs,dim_inputs) 
  # Following codes use maximin Latin Hypercube Design, which is typically better than uniform
  # library(lhs)
  # input <- maximinLHS(n=num_obs, k=dim_inputs)  ##maximin lhd sample
  
  # outputs from the 2 dim Brainin function
  
  output <- matrix(0,num_obs,1)
  for(i in 1:num_obs){
    output[i]<-limetal.2.data (input[i,])
  }
  
  #mean basis (trend)
  X<-cbind(rep(1,num_obs), input )
  
  
  # use constant mean basis with trend, with no constraint on optimization
  m2<- rgasp(design = input, response = output,trend =X,  lower_bound=FALSE,multiple_start=TRUE)
  
  
  # number of points to be predicted 
  num_testing_input <- 5000    
  # generate points to be predicted
  testing_input <- matrix(runif(num_testing_input*dim_inputs),num_testing_input,dim_inputs)
  
  # trend of testing
  testing_X<-cbind(rep(1,num_testing_input), testing_input )
  
  
  # Perform prediction
  m2.predict<-predict(m2, testing_input,testing_trend=testing_X)
  # Predictive mean
  #m2.predict$mean  
  
  # The following tests how good the prediction is 
  testing_output <- matrix(0,num_testing_input,1)
  for(i in 1:num_testing_input){
    testing_output[i]<-limetal.2.data(testing_input[i,])
  }
  
  # compute the MSE, average coverage and average length
  # out of sample MSE
  MSE_emulator <- sum((m2.predict$mean-testing_output)^2)/(num_testing_input)  
  
  # proportion covered by 95% posterior predictive credible interval
  prop_emulator <- length(which((m2.predict$lower95<=testing_output)
                   &(m2.predict$upper95>=testing_output)))/num_testing_input
  
  # average length of  posterior predictive credible interval
  length_emulator <- sum(m2.predict$upper95-m2.predict$lower95)/num_testing_input
  
  # output of prediction
  MSE_emulator
  prop_emulator
  length_emulator  
  # normalized RMSE
  sqrt(MSE_emulator/mean((testing_output-mean(output))^2 ))


  #--------------------------------------------------------------------------------------
  # an 8 dimensional example using only a subset inputs and a noise with unknown variance
  #--------------------------------------------------------------------------------------
  # dimensional of the inputs
  dim_inputs <- 8    
  # number of the inputs
  num_obs <- 30       
  
  # uniform samples of design
  input <-matrix(runif(num_obs*dim_inputs), num_obs,dim_inputs) 
  # Following codes use maximin Latin Hypercube Design, which is typically better than uniform
  # library(lhs)
  # input <- maximinLHS(n=num_obs, k=dim_inputs)  # maximin lhd sample
  
  # rescale the design to the domain
  input[,1]<-0.05+(0.15-0.05)*input[,1];
  input[,2]<-100+(50000-100)*input[,2];
  input[,3]<-63070+(115600-63070)*input[,3];
  input[,4]<-990+(1110-990)*input[,4];
  input[,5]<-63.1+(116-63.1)*input[,5];
  input[,6]<-700+(820-700)*input[,6];
  input[,7]<-1120+(1680-1120)*input[,7];
  input[,8]<-9855+(12045-9855)*input[,8];
  
  # outputs from the 8 dim Borehole function
  
  output=matrix(0,num_obs,1)
  for(i in 1:num_obs){
    output[i]=borehole(input[i,])
  }
  
  
    
    
  
  # use constant mean basis with trend, with no constraint on optimization
  m3<- rgasp(design = input[,c(1,4,6,7,8)], response = output,
             nugget.est=TRUE, lower_bound=FALSE,multiple_start=TRUE)
  
  
  # number of points to be predicted 
  num_testing_input <- 5000    
  # generate points to be predicted
  testing_input <- matrix(runif(num_testing_input*dim_inputs),num_testing_input,dim_inputs)
  
  # resale the points to the region to be predict
  testing_input[,1]<-0.05+(0.15-0.05)*testing_input[,1];
  testing_input[,2]<-100+(50000-100)*testing_input[,2];
  testing_input[,3]<-63070+(115600-63070)*testing_input[,3];
  testing_input[,4]<-990+(1110-990)*testing_input[,4];
  testing_input[,5]<-63.1+(116-63.1)*testing_input[,5];
  testing_input[,6]<-700+(820-700)*testing_input[,6];
  testing_input[,7]<-1120+(1680-1120)*testing_input[,7];
  testing_input[,8]<-9855+(12045-9855)*testing_input[,8];
  
  
  # Perform prediction
  m3.predict<-predict(m3, testing_input[,c(1,4,6,7,8)])
  # Predictive mean
  #m3.predict$mean  
  
  # The following tests how good the prediction is 
  testing_output <- matrix(0,num_testing_input,1)
  for(i in 1:num_testing_input){
    testing_output[i]<-borehole(testing_input[i,])
  }
  
  # compute the MSE, average coverage and average length
  # out of sample MSE
  MSE_emulator <- sum((m3.predict$mean-testing_output)^2)/(num_testing_input)  
  
  # proportion covered by 95% posterior predictive credible interval
  prop_emulator <- length(which((m3.predict$lower95<=testing_output)
                   &(m3.predict$upper95>=testing_output)))/num_testing_input
  
  # average length of  posterior predictive credible interval
  length_emulator <- sum(m3.predict$upper95-m3.predict$lower95)/num_testing_input
  
  # output of sample prediction
  MSE_emulator
  prop_emulator
  length_emulator  
  # normalized RMSE
  sqrt(MSE_emulator/mean((testing_output-mean(output))^2 ))




