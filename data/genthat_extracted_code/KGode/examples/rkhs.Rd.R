library(KGode)


### Name: rkhs
### Title: The 'rkhs' class object
### Aliases: rkhs
### Keywords: data

### ** Examples

## Don't show: 
  ##examples for checks: executable in < 5 sec together with the examples above not shown to users
  ### define ode 
  toy_fun = function(t,x,par_ode){
       alpha=par_ode[1]
      as.matrix( c( -alpha*x[1]) )
   }

   toy_grlNODE= function(par,grad_ode,y_p,z_p) { 
       alpha = par[1]
       dres= c(0)
       dres[1] = sum( 2*( z_p-grad_ode)*y_p*alpha ) #sum( -2*( z_p[1,2:lm]-dz1)*z1*alpha ) 
       dres
   }

  t_no = c(0.1,1,2,3,4,8)
  n_o = length(t_no)   
  y_no =  matrix( c(exp(-t_no)),ncol=1  )
  ######################## create and initialise ode object #########################################
 init_par = rep(c(0.1))
 init_yode = t(y_no)
 init_t = t_no

 kkk = ode$new(1,fun=toy_fun,grfun=toy_grlNODE,t=init_t,ode_par= init_par, y_ode=init_yode )

 ##### using kernel ridge regression to learn the interpolation of the noisy observation

 initlen = 1
 aker = RBF$new(initlen)
 bbb = rkhs$new(t(y_no)[1,],t_no,rep(1,n_o),1,aker)
## optimise lambda by cross-validation
## initial value of lambda
 initlam = 2
 bbb$skcross( initlam ) 

## End(Don't show)
## Not run: 
##D require(mvtnorm)
##D noise = 0.1  ## set the variance of noise
##D SEED = 19537
##D set.seed(SEED)
##D ## Define ode function, we use lotka-volterra model in this example. 
##D ## we have two ode states x[1], x[2] and four ode parameters alpha, beta, gamma and delta.
##D LV_fun = function(t,x,par_ode){
##D   alpha=par_ode[1]
##D   beta=par_ode[2]
##D   gamma=par_ode[3]
##D   delta=par_ode[4]
##D   as.matrix( c( alpha*x[1]-beta*x[2]*x[1] , -gamma*x[2]+delta*x[1]*x[2] ) )
##D }
##D ## Define the gradient of ode function against ode parameters 
##D ## df/dalpha,  df/dbeta, df/dgamma, df/ddelta where f is the differential equation.
##D LV_grlNODE= function(par,grad_ode,y_p,z_p) { 
##D alpha = par[1]; beta= par[2]; gamma = par[3]; delta = par[4]
##D dres= c(0)
##D dres[1] = sum( -2*( z_p[1,]-grad_ode[1,])*y_p[1,]*alpha ) 
##D dres[2] = sum( 2*( z_p[1,]-grad_ode[1,])*y_p[2,]*y_p[1,]*beta)
##D dres[3] = sum( 2*( z_p[2,]-grad_ode[2,])*gamma*y_p[2,] )
##D dres[4] = sum( -2*( z_p[2,]-grad_ode[2,])*y_p[2,]*y_p[1,]*delta)
##D dres
##D }
##D 
##D ## create a ode class object
##D kkk0 = ode$new(2,fun=LV_fun,grfun=LV_grlNODE)
##D ## set the initial values for each state at time zero.
##D xinit = as.matrix(c(0.5,1))
##D ## set the time interval for the ode numerical solver.
##D tinterv = c(0,6)
##D ## solve the ode numerically using predefined ode parameters. alpha=1, beta=1, gamma=4, delta=1.
##D kkk0$solve_ode(c(1,1,4,1),xinit,tinterv) 
##D 
##D ## Add noise to the numerical solution of the ode model and use it as the noisy observation.
##D n_o = max( dim( kkk0$y_ode) )
##D t_no = kkk0$t
##D y_no =  t(kkk0$y_ode) + rmvnorm(n_o,c(0,0),noise*diag(2))
##D 
##D ## Create a ode class object by using the simulation data we created from the ode numerical solver.
##D ## If users have experiment data, they can replace the simulation data with the experiment data.
##D ## Set initial value of ode parameters.
##D init_par = rep(c(0.1),4)
##D init_yode = t(y_no)
##D init_t = t_no
##D kkk = ode$new(1,fun=LV_fun,grfun=LV_grlNODE,t=init_t,ode_par= init_par, y_ode=init_yode )
##D 
##D ## The following examples with CPU or elapsed time > 5s
##D ####### rkhs interpolation for the 1st state of ode using 'rbf' kernel
##D ### set initial value of length scale of rbf kernel
##D initlen = 1
##D aker = RBF$new(initlen)
##D bbb = rkhs$new(t(y_no)[1,],t_no,rep(1,n_o),1,aker)
##D ## optimise lambda by cross-validation
##D ## initial value of lambda
##D initlam = 2
##D bbb$skcross( initlam ) 
##D 
##D ## make prediction using the 'predict()' method of 'rkhs' class and plot against the time.
##D plot(t_no,bbb$predict()$pred)
## End(Not run)



