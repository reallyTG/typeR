library(FastGaSP)


### Name: fgasp
### Title: Setting up the Fast GaSP model
### Aliases: fgasp fgasp-method

### ** Examples


library(FastGaSP)

#-------------------------------------
# Example 1: a simple example with noise 
#-------------------------------------

y_R<-function(x){
  cos(2*pi*x)
}

###let's test for 2000 observations
set.seed(1)
num_obs=2000
input=runif(num_obs)

output=y_R(input)+rnorm(num_obs,mean=0,sd=0.1)

##constucting the fgasp.model
fgasp.model=fgasp(input, output)
show(fgasp.model)

#------------------------------------------
# Example 2: a simple example with no noise 
#------------------------------------------

y_R<-function(x){
  sin(2*pi*x)
}


##generate some data without noise
num_obs=50
input=seq(0,1,1/(num_obs-1))

output=y_R(input)


##constucting the fgasp.model
fgasp.model=fgasp(input, output,have_noise=FALSE)

show(fgasp.model)




