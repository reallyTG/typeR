library(yuima)


### Name: simulate
### Title: Simulator function for multi-dimensional stochastic processes
### Aliases: simulate
### Keywords: ts

### ** Examples

set.seed(123)

# Path-simulation for 1-dim diffusion process. 
# dXt = -0.3*Xt*dt + dWt
mod <- setModel(drift="-0.3*y", diffusion=1, solve.variable=c("y"))
str(mod)

# Set the model in an `yuima' object with a sampling scheme. 
T <- 1
n <- 1000
samp <- setSampling(Terminal=T, n=n)
ou <- setYuima(model=mod, sampling=samp)

# Solve SDEs using Euler-Maruyama method. 
par(mfrow=c(3,1))
ou <- simulate(ou, xinit=1)
plot(ou)


set.seed(123)
ouB <- simulate(mod, xinit=1,sampling=samp)
plot(ouB)


set.seed(123)
ouC <- simulate(mod, xinit=1, Terminal=1, n=1000)
plot(ouC)

par(mfrow=c(1,1))


# Path-simulation for 1-dim diffusion process. 
# dXt = theta*Xt*dt + dWt
mod1 <- setModel(drift="theta*y", diffusion=1, solve.variable=c("y"))
str(mod1)
ou1 <- setYuima(model=mod1, sampling=samp)

# Solve SDEs using Euler-Maruyama method. 
ou1 <- simulate(ou1, xinit=1, true.p = list(theta=-0.3))
plot(ou1)

## Not run: 
##D 
##D # A multi-dimensional (correlated) diffusion process. 
##D # To describe the following model: 
##D # X=(X1,X2,X3); dXt = U(t,Xt)dt + V(t)dWt
##D # For drift coeffcient
##D U <- c("-x1","-2*x2","-t*x3")
##D # For diffusion coefficient of X1 
##D v1 <- function(t) 0.5*sqrt(t)
##D # For diffusion coefficient of X2
##D v2 <- function(t) sqrt(t)
##D # For diffusion coefficient of X3
##D v3 <- function(t) 2*sqrt(t)
##D # correlation
##D rho <- function(t) sqrt(1/2)
##D # coefficient matrix for diffusion term
##D V <- matrix( c( "v1(t)",
##D                 "v2(t) * rho(t)",
##D                 "v3(t) * rho(t)",
##D                 "",
##D                 "v2(t) * sqrt(1-rho(t)^2)",
##D                 "",
##D                 "",
##D                 "",
##D                 "v3(t) * sqrt(1-rho(t)^2)" 
##D                ), 3, 3)
##D # Model sde using "setModel" function
##D cor.mod <- setModel(drift = U, diffusion = V,
##D state.variable=c("x1","x2","x3"), 
##D solve.variable=c("x1","x2","x3") )
##D str(cor.mod)
##D 
##D # Set the `yuima' object. 
##D cor.samp <- setSampling(Terminal=T, n=n)
##D cor <- setYuima(model=cor.mod, sampling=cor.samp)
##D 
##D # Solve SDEs using Euler-Maruyama method. 
##D set.seed(123)
##D cor <- simulate(cor)
##D plot(cor)
##D 
##D # A non-negative process (CIR process)
##D # dXt= a*(c-y)*dt + b*sqrt(Xt)*dWt
##D  sq <- function(x){y = 0;if(x>0){y = sqrt(x);};return(y);}
##D  model<- setModel(drift="0.8*(0.2-x)",
##D   diffusion="0.5*sq(x)",solve.variable=c("x"))
##D  T<-10
##D  n<-1000
##D  sampling <- setSampling(Terminal=T,n=n)
##D  yuima<-setYuima(model=model, sampling=sampling)
##D  cir<-simulate(yuima,xinit=0.1)
##D  plot(cir)
##D 
##D # solve SDEs using Space-discretized Euler-Maruyama method
##D v4 <- function(t,x){
##D   return(0.5*(1-x)*sqrt(t))
##D }
##D mod_sd <- setModel(drift = c("0.1*x1", "0.2*x2"),
##D                      diffusion = c("v1(t)","v4(t,x2)"),
##D                      solve.var=c("x1","x2")
##D                      )
##D samp_sd <- setSampling(Terminal=T, n=n)
##D sd <- setYuima(model=mod_sd, sampling=samp_sd)
##D sd <- simulate(sd, xinit=c(1,1), space.discretized=TRUE)
##D plot(sd)
##D 
##D 
##D ## example of simulation by specifying increments
##D ## Path-simulation for 1-dim diffusion process
##D ## dXt = -0.3*Xt*dt + dWt
##D 
##D mod <- setModel(drift="-0.3*y", diffusion=1,solve.variable=c("y"))
##D str(mod)
##D 
##D ## Set the model in an `yuima' object with a sampling scheme. 
##D Terminal <- 1
##D n <- 500
##D mod.sampling <- setSampling(Terminal=Terminal, n=n)
##D yuima.mod <- setYuima(model=mod, sampling=mod.sampling)
##D 
##D ##use original increment
##D delta <- Terminal/n
##D my.dW <- rnorm(n * yuima.mod@model@noise.number, 0, sqrt(delta))
##D my.dW <- t(matrix(my.dW, nrow=n, ncol=yuima.mod@model@noise.number))
##D 
##D ## Solve SDEs using Euler-Maruyama method.
##D yuima.mod <- simulate(yuima.mod,
##D                       xinit=1,
##D                       space.discretized=FALSE,
##D                       increment.W=my.dW)
##D if( !is.null(yuima.mod) ){
##D  dev.new()
##D  # x11()
##D   plot(yuima.mod)
##D }
##D 
##D ## A multi-dimensional (correlated) diffusion process. 
##D ## To describe the following model: 
##D ## X=(X1,X2,X3); dXt = U(t,Xt)dt + V(t)dWt
##D ## For drift coeffcient
##D U <- c("-x1","-2*x2","-t*x3")
##D ## For process 1
##D diff.coef.1 <- function(t) 0.5*sqrt(t)
##D ## For process 2
##D diff.coef.2 <- function(t) sqrt(t)
##D ## For process 3
##D diff.coef.3 <- function(t) 2*sqrt(t)
##D ## correlation
##D cor.rho <- function(t) sqrt(1/2)
##D ## coefficient matrix for diffusion term
##D V <- matrix( c( "diff.coef.1(t)",
##D                "diff.coef.2(t) * cor.rho(t)",
##D                "diff.coef.3(t) * cor.rho(t)",
##D                "",
##D                "diff.coef.2(t)",
##D                "diff.coef.3(t) * sqrt(1-cor.rho(t)^2)",
##D                "diff.coef.1(t) * cor.rho(t)",
##D                "",
##D                "diff.coef.3(t)" 
##D                ), 3, 3)
##D ## Model sde using "setModel" function
##D cor.mod <- setModel(drift = U, diffusion = V,
##D                     solve.variable=c("x1","x2","x3") )
##D str(cor.mod)
##D ## Set the `yuima' object.
##D set.seed(123)
##D obj.sampling <- setSampling(Terminal=Terminal, n=n)
##D yuima.obj <- setYuima(model=cor.mod, sampling=obj.sampling)
##D 
##D ##use original dW
##D my.dW <- rnorm(n * yuima.obj@model@noise.number, 0, sqrt(delta))
##D my.dW <- t(matrix(my.dW, nrow=n, ncol=yuima.obj@model@noise.number))
##D 
##D ## Solve SDEs using Euler-Maruyama method.
##D yuima.obj.path <- simulate(yuima.obj, space.discretized=FALSE, 
##D  increment.W=my.dW)
##D if( !is.null(yuima.obj.path) ){
##D   dev.new()
##D #  x11()
##D   plot(yuima.obj.path)
##D }
##D 
##D 
##D ##:: sample for Levy process ("CP" type)
##D ## specify the jump term as c(x,t)dz
##D obj.model <- setModel(drift=c("-theta*x"), diffusion="sigma",
##D jump.coeff="1", measure=list(intensity="1", df=list("dnorm(z, 0, 1)")),
##D measure.type="CP", solve.variable="x")
##D 
##D ##:: Parameters
##D lambda <- 3
##D theta <- 6
##D sigma <- 1
##D xinit <- runif(1)
##D N <- 500
##D h <- N^(-0.7)
##D eps <- h/50
##D n <- 50*N
##D T <- N*h
##D 
##D set.seed(123)
##D obj.sampling <- setSampling(Terminal=T, n=n)
##D obj.yuima <- setYuima(model=obj.model, sampling=obj.sampling)
##D X <- simulate(obj.yuima, xinit=xinit, true.parameter=list(theta=theta, sigma=sigma))
##D dev.new()
##D plot(X)
##D 
##D 
##D ##:: sample for Levy process ("CP" type)
##D ## specify the jump term as c(x,t,z)
##D ## same plot as above example
##D obj.model <- setModel(drift=c("-theta*x"), diffusion="sigma",
##D jump.coeff="z", measure=list(intensity="1", df=list("dnorm(z, 0, 1)")),
##D measure.type="CP", solve.variable="x")
##D 
##D set.seed(123)
##D obj.sampling <- setSampling(Terminal=T, n=n)
##D obj.yuima <- setYuima(model=obj.model, sampling=obj.sampling)
##D X <- simulate(obj.yuima, xinit=xinit, true.parameter=list(theta=theta, sigma=sigma))
##D dev.new()
##D plot(X)
##D 
##D 
##D 
##D 
##D ##:: sample for Levy process ("code" type)
##D ## dX_{t} = -x dt + dZ_t
##D obj.model <- setModel(drift="-x", xinit=1, jump.coeff="1", measure.type="code", 
##D measure=list(df="rIG(z, 1, 0.1)"))
##D obj.sampling <- setSampling(Terminal=10, n=10000)
##D obj.yuima <- setYuima(model=obj.model, sampling=obj.sampling)
##D result <- simulate(obj.yuima)
##D dev.new()
##D plot(result)
##D 
##D ##:: sample for multidimensional Levy process ("code" type)
##D ## dX = (theta - A X)dt + dZ,
##D ##    theta=(theta_1, theta_2) = c(1,.5)
##D ##    A=[a_ij], a_11 = 2, a_12 = 1, a_21 = 1, a_22=2
##D require(yuima)
##D x0 <- c(1,1)
##D beta <- c(.1,.1)
##D mu <- c(0,0)
##D delta0 <- 1
##D alpha <- 1
##D Lambda <- matrix(c(1,0,0,1),2,2)
##D cc <- matrix(c(1,0,0,1),2,2)
##D obj.model <- setModel(drift=c("1 - 2*x1-x2",".5-x1-2*x2"), xinit=x0,
##D solve.variable=c("x1","x2"), jump.coeff=cc, measure.type="code",
##D  measure=list(df="rNIG(z, alpha, beta, delta0, mu, Lambda)"))
##D obj.sampling <- setSampling(Terminal=10, n=10000)
##D obj.yuima <- setYuima(model=obj.model, sampling=obj.sampling)
##D result <- simulate(obj.yuima,true.par=list( alpha=alpha, 
##D  beta=beta, delta0=delta0, mu=mu, Lambda=Lambda))
##D plot(result)
##D 
##D 
##D # Path-simulation for a Carma(p=2,q=1) model driven by a Brownian motion:
##D carma1<-setCarma(p=2,q=1)
##D str(carma1)
##D 
##D # Set the sampling scheme
##D samp<-setSampling(Terminal=100,n=10000)
##D 
##D # Set the values of the model parameters
##D par.carma1<-list(b0=1,b1=2.8,a1=2.66,a2=0.3)
##D 
##D set.seed(123)
##D sim.carma1<-simulate(carma1,
##D                      true.parameter=par.carma1,
##D                      sampling=samp)
##D 
##D plot(sim.carma1)
##D 
##D 
##D 
##D # Path-simulation for a Carma(p=2,q=1) model driven by a Compound Poisson process.
##D carma1<-setCarma(p=2,
##D                  q=1,
##D                  measure=list(intensity="1",df=list("dnorm(z, 0, 1)")),
##D                  measure.type="CP")
##D 
##D # Set Sampling scheme
##D samp<-setSampling(Terminal=100,n=10000)
##D 
##D # Fix carma parameters
##D par.carma1<-list(b0=1,
##D                  b1=2.8,
##D                  a1=2.66,
##D                  a2=0.3)
##D 
##D set.seed(123)
##D sim.carma1<-simulate(carma1,
##D                      true.parameter=par.carma1,
##D                      sampling=samp)
##D 
##D plot(sim.carma1)
## End(Not run)



