library(bliss)


### Name: choose_beta
### Title: choose_beta
### Aliases: choose_beta

### ** Examples

### smooth
param <- list(p=100,grid=seq(0,1,length=100),shape="smooth")
beta_function <- choose_beta(param)
plot(param$grid,beta_function,type="l")
### random_smooth
param <- list(p=100,grid=seq(0,1,length=100),shape="random_smooth")
beta_function <- choose_beta(param)
plot(param$grid,beta_function,type="l")
### simple
param <- list(p=100,grid=seq(0,1,length=100),shape="simple")
beta_function <- choose_beta(param)
plot(param$grid,beta_function,type="s")
### simple_bis
param <- list(p=100,grid=seq(0,1,length=100),shape="simple_bis")
beta_function <- choose_beta(param)
plot(param$grid,beta_function,type="s")
### random_simple
param <- list(p=100,grid=seq(0,1,length=100),shape="random_simple")
beta_function <- choose_beta(param)
plot(param$grid,beta_function,type="s")
### sinusoid
param <- list(p=100,grid=seq(0,1,length=100),shape="sinusoid")
beta_function <- choose_beta(param)
plot(param$grid,beta_function,type="l")
### flat_sinusoid
param <- list(p=100,grid=seq(0,1,length=100),shape="flat_sinusoid")
beta_function <- choose_beta(param)
plot(param$grid,beta_function,type="l")
### sharp
param <- list(p=100,grid=seq(0,1,length=100),shape="sharp")
beta_function <- choose_beta(param)
plot(param$grid,beta_function,type="l")



