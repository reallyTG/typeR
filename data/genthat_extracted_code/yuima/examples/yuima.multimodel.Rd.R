library(yuima)


### Name: yuima.multimodel-class
### Title: Class for the mathematical description of Multi dimensional Jump
###   Diffusion processes
### Aliases: yuima.multimodel-class yuima.multimodel
###   initialize,yuima.multimodel-method simulate,yuima.multimodel-method
### Keywords: classes

### ** Examples

## Not run: 
##D # We define the density function of the underlying Levy
##D 
##D dmyexp <- function(z, sig1, sig2, sig3){
##D   rep(0,3)
##D }
##D 
##D # We define the random number generator
##D 
##D rmyexp <- function(z, sig1, sig2, sig3){
##D   cbind(rnorm(z,0,sig1), rgamma(z,1,sig2), rnorm(z,0,sig3))
##D }
##D 
##D # Model Definition: in this case we consider only a multi
##D # compound poisson process with a common intensity as underlying
##D # noise
##D 
##D mod <- setModel(drift = matrix(c("0","0","0"),3,1), diffusion = NULL,
##D   jump.coeff = matrix(c("1","0","0","0","1","-1","1","0","0"),3,3),
##D   measure = list( intensity = "lambda1", df = "dmyexp(z,sig1,sig2,sig3)"),
##D   jump.variable = c("z"), measure.type=c("CP"),
##D   solve.variable=c("X1","X2","X3"))
##D 
##D # Sample scheme
##D 
##D samp<-setSampling(0,100,n=1000)
##D param <- list(lambda1 = 1, sig1 = 0.1, sig2 = 0.1, sig3 = 0.1)
##D 
##D # Simulation
##D 
##D traj <- simulate(object = mod, sampling = samp,
##D   true.parameter = param)
##D 
##D # Plot
##D 
##D plot(traj, main = " driven noise. Multidimensional CP",
##D   cex.main = 0.8)
##D 
##D # We construct a multidimensional SDE driven by a multivariate
##D # levy process without CP components.
##D 
##D # Definition multivariate density
##D 
##D dmyexp1 <- function(z, sig1, sig2, sig3){
##D   rep(0,3)
##D }
##D 
##D # Definition of random number generator
##D # In this case user must define the delta parameter in order to
##D # control the effect of time interval in the simulation.
##D 
##D rmyexp1 <- function(z, sig1, sig2, sig3, delta){
##D   cbind(rexp(z,sig1*delta), rgamma(z,1*delta,sig2), rexp(z,sig3*delta))
##D }
##D 
##D # Model defintion
##D 
##D mod1 <- setModel(drift=matrix(c("0.1*(0.01-X1)",
##D   "0.05*(1-X2)","0.1*(0.1-X3)"),3,1), diffusion=NULL,
##D    jump.coeff = matrix(c("0.01","0","0","0","0.01",
##D                           "0","0","0","0.01"),3,3),
##D    measure = list(df="dmyexp1(z,sig1,sig2,sig3)"),
##D    jump.variable = c("z"), measure.type=c("code"),
##D    solve.variable=c("X1","X2","X3"),xinit=c("10","1.2","10"))
##D 
##D # Simulation sample paths
##D 
##D samp<-setSampling(0,100,n=1000)
##D param <- list(sig1 = 1, sig2 = 1, sig3 = 1)
##D 
##D # Simulation
##D 
##D set.seed(1)
##D traj1 <- simulate(object = mod1, sampling = samp,
##D   true.parameter = param)
##D 
##D # Plot
##D 
##D plot(traj1, main = "driven noise: multi Levy without CP",
##D   cex.main = 0.8)
##D 
##D # We construct a multidimensional SDE driven by a multivariate
##D # levy process.
##D 
##D # We consider a mixed situation where some
##D # noise are driven by a multivariate Compuond Poisson that
##D # shares a common intensity parameters.
##D 
##D ### Multi Levy model
##D 
##D rmyexample2<-function(z,sig1,sig2,sig3, delta){
##D     if(missing(delta)){
##D       delta<-1
##D     }
##D     cbind(rexp(z,sig1*delta), rgamma(z,1*delta,sig2),
##D         rexp(z,sig3*delta), rep(1,z),
##D         rep(1,z))
##D }
##D 
##D dmyexample2<-function(z,sig1,sig2,sig3){
##D   rep(0,5)
##D }
##D 
##D # Definition Model
##D 
##D mod2 <- setModel(drift=matrix(c("0.1*(0.01-X1)",
##D   "0.05*(1-X2)","0.1*(0.1-X3)", "0", "0"),5,1), diffusion=NULL,
##D   jump.coeff = matrix(c("0.01","0","0","0","0",
##D                         "0","0.01","0","0","0",
##D                         "0","0","0.01","0","0",
##D                         "0","0","0","0.01","0",
##D                         "0","0","0","0","0.01"),5,5),
##D   measure = list(df = "dmyexample2(z,sig1,sig2,sig3)",
##D             intensity = "lambda1"),
##D   jump.variable = c("z"),
##D   measure.type=c("code","code","code","CP","CP"),
##D   solve.variable=c("X1","X2","X3","X4","X5"),
##D   xinit=c("10","1.2","10","0","0"))
##D 
##D # Simulation scheme
##D samp <- setSampling(0, 100, n = 1000)
##D param <- list(sig1 = 1, sig2 = 1, sig3 = 1, lambda1 = 1)
##D 
##D # Simulation
##D 
##D set.seed(1)
##D traj2 <- simulate(object = mod2, sampling = samp,
##D   true.parameter = param)
##D 
##D plot(traj2, main = "driven noise: general multi Levy", cex.main = 0.8)
##D 
## End(Not run)



