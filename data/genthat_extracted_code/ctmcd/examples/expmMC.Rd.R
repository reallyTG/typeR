library(ctmcd)


### Name: expmMC
### Title: Matrix Exponential Function
### Aliases: expmMC

### ** Examples

### Exemplary Transition Matrix
tm0=matrix(1:16,4,4)
tm0=tm0/rowSums(tm0)
tm0[4,]=c(0,0,0,1)

### Generator Matrix Estimate
gm_est=gm(tm0,te=1,method="DA")
gm_est

### Matrix Exponential and Conversion to markovchain object 
### (markovchain package needs to be installed)
mc=expmMC(gm_est,.5)
if(require("markovchain")==TRUE){
  plot(mc)
}



