library(RobustGaSP)


### Name: rgasp
### Title: Setting up the robust GaSP model
### Aliases: rgasp rgasp-method

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
  
  # the following use constraints on optimization
  # m1<- rgasp(design = input, response = output, lower_bound=TRUE)
  
  # the following use a single start on optimization
  # m1<- rgasp(design = input, response = output, lower_bound=FALSE, multiple_starts=FALSE)

    show(m1)      ####show this rgasp object 

    m1@beta_hat       ####estimated inverse range parameters
  
  #
  #---------------------------------------
  # a 1 dimensional example with zero mean
  #---------------------------------------


  input=10*seq(0,1,1/14)
  output<-higdon.1.data(input)
  #the following code fit a GaSP with zero mean by setting zero.mean="Yes"
  model<- rgasp(design = input, response = output, zero.mean="Yes")
  model
  
  testing_input = as.matrix(seq(0,10,1/100))
  model.predict<-predict(model,testing_input)
  names(model.predict)
  
  #########plot predictive distribution
  testing_output=higdon.1.data(testing_input)
  plot(testing_input,model.predict$mean,type='l',col='blue',
       xlab='input',ylab='output')
  polygon( c(testing_input,rev(testing_input)),c(model.predict$lower95,
        rev(model.predict$upper95)),col =  "grey80", border = FALSE)
  lines(testing_input, testing_output)
  lines(testing_input,model.predict$mean,type='l',col='blue')
  lines(input, output,type='p')
  
  ## mean square erros
  mean((model.predict$mean-testing_output)^2)

 

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
  # input <- maximinLHS(n=num_obs, k=dim_inputs)  # maximin lhd sample
  
  # outputs from a 2 dim function
  
  output <- matrix(0,num_obs,1)
  for(i in 1:num_obs){
    output[i]<-limetal.2.data (input[i,])
  }
  
  ####trend or mean basis
  X<-cbind(rep(1,num_obs), input )
  
  
  # use constant mean basis with trend, with no constraint on optimization
  m2<- rgasp(design = input, response = output,trend =X,  lower_bound=FALSE,multiple_start=TRUE)

  show(m2)      # show this rgasp object 
  
  m2@beta_hat       # estimated inverse range parameters
  m2@theta_hat  

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

m3@beta_hat       # estimated inverse range parameters
m3@nugget     





