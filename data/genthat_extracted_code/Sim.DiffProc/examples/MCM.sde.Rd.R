library(Sim.DiffProc)


### Name: MCM.sde
### Title: Parallel Monte-Carlo Methods for SDE's
### Aliases: MCM.sde MCM.sde.default print.MCM.sde plot.MCM.sde
### Keywords: Monte-Carlo sde ts mts parallel

### ** Examples

## Example 1 : (1 dim)
## dX(t) = 3*(1-X(t)) dt + 0.5 * dW(t), X(0)=5, t in [0,10]
## set the model 1d
f <- expression(3*(1-x));g <- expression(0.5)
mod1d <-  snssde1d(drift=f,diffusion=g,x0=5,T=10,M=50)

## function of the statistic(s) of interest.
sde.fun1d <- function(data, i){
  d <- data[i, ]
  return(c(mean(d),Mode(d),var(d)))
}

mc.sde1d = MCM.sde(model=mod1d,statistic=sde.fun1d,R=100,exact=list(Me=1,Mo=1,Va=0.5^2/6),
                 names=c("Me(10)","Mo(10)","Va(10)"))
mc.sde1d
plot(mc.sde1d,index=1)
plot(mc.sde1d,index=2)
plot(mc.sde1d,index=3)

## Example 2 : with Parallel computing
## Not run: 
##D mod1d <-  snssde1d(drift=f,diffusion=g,x0=5,T=10,M=1000)
##D ## On Windows or Unix
##D mc.sde1d = MCM.sde(model=mod1d,statistic=sde.fun1d,R=1000,exact=list(Me=1,Mo=1,Va=0.5^2/6),
##D            names=c("Me(10)","Mo(10)","Va(10)"),parallel="snow",ncpus=parallel::detectCores())
##D mc.sde1d
##D ## On Unix only
##D mc.sde1d = MCM.sde(model=mod1d,statistic=sde.fun1d,R=1000,exact=list(Me=1,Mo=1,Va=0.5^2/6),
##D            names=c("Me(10)","Mo(10)","Va(10)"),parallel="multicore",ncpus=parallel::detectCores())
##D mc.sde1d
## End(Not run)

## Example 3: (2 dim)
## dX(t) = 1/mu*(theta-X(t)) dt + sqrt(sigma) * dW1(t),
## dY(t) = X(t) dt + 0 * dW2(t)
## Not run: 
##D ## Set the model 2d
##D mu=0.75;sigma=0.1;theta=2
##D x0=0;y0=0;init=c(x=0,y=0)
##D f <- expression(1/mu*(theta-x), x)  
##D g <- expression(sqrt(sigma),0)
##D OUI <- snssde2d(drift=f,diffusion=g,M=1000,Dt=0.01,x0=init)
##D 
##D ## function of the statistic(s) of interest.
##D sde.fun2d <- function(data, i){
##D   d <- data[i,]
##D   return(c(mean(d$x),mean(d$y),var(d$x),var(d$y),cov(d$x,d$y)))
##D }
##D ## Monte-Carlo at time = 5
##D mc.sde2d_a = MCM.sde(model=OUI,statistic=sde.fun2d,R=100,time=5,
##D                   parallel="snow",ncpus=parallel::detectCores())
##D mc.sde2d_a
##D ## Monte-Carlo at time = 10
##D mc.sde2d_b = MCM.sde(model=OUI,statistic=sde.fun2d,R=100,time=10,
##D                   parallel="snow",ncpus=parallel::detectCores())
##D mc.sde2d_b
##D 
##D ## Compared with exact values at time 5 and 10
##D E_x <- function(t) theta+(x0-theta)*exp(-t/mu)
##D V_x <- function(t) 0.5*sigma*mu *(1-exp(-2*(t/mu)))
##D E_y <- function(t) y0+theta*t+(x0-theta)*mu*(1-exp(-t/mu))
##D V_y <- function(t) sigma*mu^3*((t/mu)-2*(1-exp(-t/mu))+0.5*(1-exp(-2*(t/mu))))
##D cov_xy <- function(t) 0.5*sigma*mu^2 *(1-2*exp(-t/mu)+exp(-2*(t/mu)))
##D 
##D ## at time=5
##D mc.sde2d_a = MCM.sde(model=OUI,statistic=sde.fun2d,R=100,time=5,
##D     exact=list(m1=E_x(5),m2=E_y(5),S1=V_x(5),S2=V_y(5),C12=cov_xy(5)),
##D 	parallel="snow",ncpus=parallel::detectCores())
##D mc.sde2d_a
##D plot(mc.sde2d_a,index=1)
##D plot(mc.sde2d_a,index=2)
##D ## at time=10
##D mc.sde2d_b = MCM.sde(model=OUI,statistic=sde.fun2d,R=100,time=10,
##D     exact=list(m1=E_x(10),m2=E_y(10),S1=V_x(10),S2=V_y(10),C12=cov_xy(10)),
##D 	parallel="snow",ncpus=parallel::detectCores())
##D mc.sde2d_b
##D plot(mc.sde2d_b,index=1)
##D plot(mc.sde2d_b,index=2)
## End(Not run)

## Example 4: (3 dim)
## dX(t) = sigma*(Y(t)-X(t)) dt + 0.1 * dW1(t)
## dY(t) = (rho*X(t)-Y(t)-X(t)*Z(t)) dt + 0.1 * dW2(t)
## dZ(t) = (X(t)*Y(t)-bet*Z(t)) dt + 0.1 * dW3(t)
## Not run: 
##D ## Set the model 3d
##D sigma=10;rho=28; bet=8/3
##D f <- expression(sigma*(y-x),rho*x-y-x*z,x*y-bet*z)
##D g <- expression(0.1,0.1,0.1)
##D mod3d <- snssde3d(x0=rep(0,3),drift=f,diffusion=g,M=1000,Dt=0.01)
##D 
##D ## function of the statistic(s) of interest.
##D sde.fun3d <- function(data, i){
##D   d <- data[i,]
##D   return(c(mean(d$x),mean(d$y),mean(d$z)))
##D }
##D ## Monte-Carlo at time = 10
##D mc.sde3d = MCM.sde(mod3d,statistic=sde.fun3d,R=100,parallel="snow",ncpus=parallel::detectCores())
##D mc.sde3d
## End(Not run)




