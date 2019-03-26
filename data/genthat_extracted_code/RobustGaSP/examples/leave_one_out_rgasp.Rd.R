library(RobustGaSP)


### Name: leave_one_out_rgasp
### Title: leave-one-out fitted values and standard deviation for robust
###   GaSP model
### Aliases: leave_one_out_rgasp

### ** Examples

library(RobustGaSP)
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
  
  ####
  # outputs from the 3 dim dettepepel.3.data function
  
  output = matrix(0,num_obs,1)
  for(i in 1:num_obs){
    output[i]<-dettepepel.3.data (input[i,])
  }
  
  # use constant mean basis, with no constraint on optimization
  m1<- rgasp(design = input, response = output, lower_bound=FALSE)
  
  ##leave one out predict
  leave_one_out_m1=leave_one_out_rgasp(m1)
  
  ##predictive mean 
  leave_one_out_m1$mean
  ##standard deviation
  leave_one_out_m1$sd
  ##standardized error
  (leave_one_out_m1$mean-output)/leave_one_out_m1$sd

  



