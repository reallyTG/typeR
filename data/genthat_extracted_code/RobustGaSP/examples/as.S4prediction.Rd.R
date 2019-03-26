library(RobustGaSP)


### Name: as.S4prediction
### Title: Convert a 'RobustGaSP' 'S3 object' prediction into a 'S4 object'
### Aliases: as.S4prediction as.S4prediction.predict
###   as.S4prediction.predrgasp-class as.S4prediction,predrgasp-method
### Keywords: internal

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
  m1.predict<-predict(m1, testing_input, outasS3 = FALSE)
  # Notice the call slot of the object
  print(m1.predict@call)
  
  # To convert the prediction to a S3 object 
  m1.predict.aslist <- as.S3prediction(m1.predict)
  # To recover back the prediction as a predrgasp-class object
  m1.predict.aspredgasp <- as.S4prediction.predict(m1.predict.aslist)
  str(m1.predict.aslist)
  # Notice that in this case the @call slot is different than the initial
  print(m1.predict.aspredgasp@call)
  



