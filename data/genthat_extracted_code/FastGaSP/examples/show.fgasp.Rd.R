library(FastGaSP)


### Name: show
### Title: Show an 'fgasp' object.
### Aliases: show show.fgasp show.fgasp-class show,fgasp-method

### ** Examples


#-------------------------------------
# Example: a simple example with noise 
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





