library(wgeesel)


### Name: data_sim
### Title: Simulate longitudinal data
### Aliases: data_sim
### Keywords: gee simulate

### ** Examples

n=500
id=rep(1:n,each=3)
rho=1
phi=1
x=cbind(1,rnorm(length(id)))
beta=c(1,1)
x_mis=cbind(1,rnorm(length(id)))
para=c(1,1,1)
data_sim(id,rho,phi,x,beta,x_mis,para,"independent","gaussian",lag_level = 1)



