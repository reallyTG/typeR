library(Sim.DiffProc)


### Name: MEM.sde
### Title: Moment Equations Methods for SDE's
### Aliases: MEM.sde MEM.sde.default print.MEM.sde summary.MEM.sde
### Keywords: moment equations sde

### ** Examples

library(deSolve)
## Example 1: 1-dim
## dX(t) = mu * X(t) * dt + sigma * X(t) * dW(t)
## Symbolic ODE's of mean and variance
f <- expression(mu*x)
g <- expression(sigma*x)
res1 <- MEM.sde(drift=f,diffusion=g)
res2 <- MEM.sde(drift=f,diffusion=g,type="str")
res1
res2
## numerical approximation of mean and variance
para <- c(mu=2,sigma=0.5)
t    <- seq(0,1,by=0.001)
init <- c(m=1,S=0)
res1 <- MEM.sde(drift=f,diffusion=g,solve=TRUE,init=init,parms=para,time=t)
res1
matplot.0D(res1$sol.ode,main="Mean and Variance of X(t), type Ito")
plot(res1$sol.ode,select=c("m","S"))
## approximation at time = 0.75
summary(res1,at=0.75)

##
res2 <- MEM.sde(drift=f,diffusion=g,solve=TRUE,init=init,parms=para,time=t,type="str")
res2
matplot.0D(res2$sol.ode,main="Mean and Variance of X(t), type Stratonovich")
plot(res2$sol.ode,select=c("m","S"))
## approximation at time = 0.75
summary(res2,at=0.75)

## Comparison:

plot(res1$sol.ode, res2$sol.ode,ylab = c("m(t)"),select="m",xlab = "Time",
     col = c("red", "blue"))
plot(res1$sol.ode, res2$sol.ode,ylab = c("S(t)"),select="S",xlab = "Time",
     col = c("red", "blue"))
	 
## Example2: 2-dim
## dX(t) = 1/mu*(theta-X(t)) dt + sqrt(sigma) * dW1(t),
## dY(t) = X(t) dt + 0 * dW2(t)	 
## Not run: 
##D para=c(mu=0.75,sigma=0.1,theta=2)
##D init=c(m1=0,m2=0,S1=0,S2=0,C12=0)
##D t <- seq(0,10,by=0.001)
##D f <- expression(1/mu*(theta-x), x)  
##D g <- expression(sqrt(sigma),0)
##D res2d <- MEM.sde(drift=f,diffusion=g,solve=TRUE,init=init,parms=para,time=t)
##D res2d
##D 
##D ## Exact moment
##D 
##D mu=0.75;sigma=0.1;theta=2;x0=0;y0=0
##D E_x <- function(t) theta+(x0-theta)*exp(-t/mu)
##D V_x <- function(t) 0.5*sigma*mu *(1-exp(-2*(t/mu)))
##D E_y <- function(t) y0+theta*t+(x0-theta)*mu*(1-exp(-t/mu))
##D V_y <- function(t) sigma*mu^3*((t/mu)-2*(1-exp(-t/mu))+0.5*(1-exp(-2*(t/mu))))
##D cov_xy <- function(t) 0.5*sigma*mu^2 *(1-2*exp(-t/mu)+exp(-2*(t/mu)))
##D 
##D ## 
##D summary(res2d,at=5)
##D E_x(5);E_y(5);V_x(5);V_y(5);cov_xy(5)
##D 
##D matplot.0D(res2d$sol.ode,select=c("m1"))
##D curve(E_x,add=TRUE,col="red") 
##D 
##D ## plot
##D 
##D plot(res2d$sol.ode)
##D matplot.0D(res2d$sol.ode,select=c("S1","S2","C12"))   
##D plot(res2d$sol.ode[,"m1"], res2d$sol.ode[,"m2"], xlab = "m1(t)",
##D   ylab = "m2(t)", type = "l",lwd = 2)
##D hist(res2d$sol.ode,select=c("m1","m2"), col = c("darkblue", "red", "orange", "black"))
##D 
##D 	 
##D ## Example3: 3-dim
##D ## dX(t) = sigma*(Y(t)-X(t)) dt + 0.1 * dW1(t)
##D ## dY(t) = (rho*X(t)-Y(t)-X(t)*Z(t)) dt + 0.1 * dW2(t)
##D ## dZ(t) = (X(t)*Y(t)-bet*Z(t)) dt + 0.1 * dW3(t)
##D f <- expression(sigma*(y-x),rho*x-y-x*z,x*y-bet*z)
##D g <- expression(0.1,0.1,0.1)
##D ## Symbolic moments equations
##D res3d = MEM.sde(drift=f,diffusion=g)
##D res3d
##D 
##D ## Numerical approximation
##D para=c(sigma=10,rho=28,bet=8/3)
##D ini=c(m1=1,m2=1,m3=1,S1=0,S2=0,S3=0,C12=0,C13=0,C23=0)
##D res3d = MEM.sde(drift=f,diffusion=g,solve=T,parms=para,init=ini,time=seq(0,1,by=0.01))
##D res3d
##D 
##D summary(res3d,at=0.25)
##D summary(res3d,at=0.50)
##D summary(res3d,at=0.75)
##D 
##D plot(res3d$sol.ode)
##D matplot.0D(res3d$sol.ode,select=c("m1","m2","m3")) 
##D matplot.0D(res3d$sol.ode,select=c("S1","S2","S3")) 
##D matplot.0D(res3d$sol.ode,select=c("C12","C13","C23")) 
##D 
##D ## 
##D library(rgl)
##D plot3d(res3d$sol.ode[,"m1"], res3d$sol.ode[,"m2"],res3d$sol.ode[,"m3"], xlab = "m1(t)",
##D   ylab = "m2(t)",zlab="m3(t)", type = "l",lwd = 2,box=F)
## End(Not run)



