library(KGode)


### Name: ode
### Title: The 'ode' class object
### Aliases: ode
### Keywords: data

### ** Examples

noise = 0.1  ## set the variance of noise
SEED = 19537
set.seed(SEED)
## Define ode function, we use lotka-volterra model in this example. 
## we have two ode states x[1], x[2] and four ode parameters alpha, beta, gamma and delta.
LV_fun = function(t,x,par_ode){
  alpha=par_ode[1]
  beta=par_ode[2]
  gamma=par_ode[3]
  delta=par_ode[4]
  as.matrix( c( alpha*x[1]-beta*x[2]*x[1] , -gamma*x[2]+delta*x[1]*x[2] ) )
}
## Define the gradient of ode function against ode parameters 
## df/dalpha,  df/dbeta, df/dgamma, df/ddelta where f is the differential equation.
LV_grlNODE= function(par,grad_ode,y_p,z_p) { 
alpha = par[1]; beta= par[2]; gamma = par[3]; delta = par[4]
dres= c(0)
dres[1] = sum( -2*( z_p[1,]-grad_ode[1,])*y_p[1,]*alpha ) 
dres[2] = sum( 2*( z_p[1,]-grad_ode[1,])*y_p[2,]*y_p[1,]*beta)
dres[3] = sum( 2*( z_p[2,]-grad_ode[2,])*gamma*y_p[2,] )
dres[4] = sum( -2*( z_p[2,]-grad_ode[2,])*y_p[2,]*y_p[1,]*delta)
dres
}

## create a ode class object
kkk0 = ode$new(2,fun=LV_fun,grfun=LV_grlNODE)
## set the initial values for each state at time zero.
xinit = as.matrix(c(0.5,1))
## set the time interval for the ode numerical solver.
tinterv = c(0,6)
## solve the ode numerically using predefined ode parameters. alpha=1, beta=1, gamma=4, delta=1.
kkk0$solve_ode(c(1,1,4,1),xinit,tinterv) 

## Create another ode class object by using the simulation data from the ode numerical solver.
## If users have experiment data, they can replace the simulation data with the experiment data.
## set initial values for ode parameters.
init_par = rep(c(0.1),4)
init_yode = kkk0$y_ode
init_t = kkk0$t
kkk = ode$new(1,fun=LV_fun,grfun=LV_grlNODE,t=init_t,ode_par= init_par, y_ode=init_yode )




