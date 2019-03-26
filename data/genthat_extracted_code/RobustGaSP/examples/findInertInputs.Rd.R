library(RobustGaSP)


### Name: findInertInputs
### Title: find inert inputs with the posterior mode
### Aliases: findInertInputs

### ** Examples

  #-----------------------------------------------
  # test for inert inputs in the Borehole function
  #-----------------------------------------------
# dimensional of the inputs
dim_inputs <- 8    
# number of the inputs
num_obs <- 40       

# uniform samples of design
set.seed(0)
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
m3<- rgasp(design = input, response = output, lower_bound=FALSE)

P=findInertInputs(m3)





