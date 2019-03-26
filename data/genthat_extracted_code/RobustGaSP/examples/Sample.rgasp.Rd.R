library(RobustGaSP)


### Name: Sample
### Title: Sample for Robust GaSP model
### Aliases: Sample Sample.rgasp Sample.rgasp-class Sample,rgasp-method
### Keywords: internal

### ** Examples

  #------------------------
  # a 1 dimensional example
  #------------------------
  
###########1dim higdon.1.data 
p1 = 1     ###dimensional of the inputs
dim_inputs1 <- p1
n1 = 15   ###sample size or number of training computer runs you have 
num_obs1 <- n1
input1 = 10*matrix(runif(num_obs1*dim_inputs1), num_obs1,dim_inputs1) ##uniform
#####lhs is better
#library(lhs)
#input1 = 10*maximinLHS(n=num_obs1, k=dim_inputs1)  ##maximin lhd sample
output1 = matrix(0,num_obs1,1)
for(i in 1:num_obs1){
  output1[i]=higdon.1.data (input1[i])
}





m1<- rgasp(design = input1, response = output1, lower_bound=FALSE)

#####locations to samples
testing_input1 = seq(0,10,1/50) 
testing_input1=as.matrix(testing_input1)
#####draw 10 samples
m1_sample=Sample(m1,testing_input1,num_sample=10)

#####plot these samples
matplot(testing_input1,m1_sample, type='l',xlab='input',ylab='output')
lines(input1,output1,type='p')





