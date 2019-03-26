library(yuima)


### Name: IC
### Title: Information criteria for the stochastic differential equation
### Aliases: IC
### Keywords: Information criteria

### ** Examples


### Ex.1 
set.seed(123)

N <- 1000   # number of data
h <- N^(-2/3)  # sampling stepsize
Ter <- N*h  # terminal sampling time

## Data generate (dXt = -Xt*dt + exp((-2*cos(Xt) + 1)/2)*dWt)
mod <- setModel(drift="theta21*x", diffusion="exp((theta11*cos(x)+theta12)/2)")
samp <- setSampling(Terminal=Ter, n = N)
yuima <- setYuima(model=mod, sampling=setSampling(Terminal=Ter, n=50*N))
simu.yuima <- simulate(yuima, xinit=1, true.parameter=list(theta11=-2, theta12=1, 
                       theta21=-1), subsampling=samp)
Xt <- NULL
for(i in 1:(N+1)){
  Xt <- c(Xt, simu.yuima@data@original.data[50*(i-1)+1])
}

## Parameter settings
para.init <- list(theta11=runif(1,max=-1.5,min=-2.5), theta12=runif(1,max=1.5,min=0.5), 
                  theta21=runif(1,max=-0.5,min=-1.5))
para.low <- list(theta11=-7, theta12=-4, theta21=-6)
para.upp <- list(theta11=3, theta12=6, theta21=4)

## Ex.1.1 (dXt = (theta21*x)*dt + exp((theta11*cos(x)+theta12)/2)*dWt)
mod1 <- setModel(drift="theta21*x", diffusion="exp((theta11*cos(x)+theta12)/2)")
samp1 <- setSampling(Terminal=Ter, n = N)
yuima1 <- setYuima(model=mod1, sampling=samp1)
ic1 <- IC(yuima1, data=Xt, start=para.init, upper=para.upp, lower=para.low, rcpp=TRUE)
ic1

## Ex.1.2 (dXt = (theta21*x)*dt + exp(theta11*cos(x)/2)*dWt)
mod2 <- setModel(drift="theta21*x", diffusion="exp(theta11*cos(x)/2)")
samp2 <- setSampling(Terminal=Ter, n = N)
yuima2 <- setYuima(model=mod2, sampling=samp2)
ic2 <- IC(yuima2, data=Xt, start=para.init, upper=para.upp, lower=para.low, rcpp=TRUE)
ic2

## Not run: 
##D ### Ex.2 (multidimansion case) 
##D set.seed(123)
##D 
##D N <- 3000   # number of data
##D h <- N^(-2/3)  # sampling stepsize
##D Ter <- N*h  # terminal sampling time
##D 
##D ## Data generate
##D diff.coef.matrix <- matrix(c("beta1+1", "beta3*x1", "-beta2*x1", "beta4+1"), 2, 2)
##D drif.coef.vec <- c("alpha1*x1", "alpha2*x2")
##D mod <- setModel(drift = drif.coef.vec, diffusion = diff.coef.matrix, 
##D                 state.variable = c("x1", "x2"), solve.variable = c("x1", "x2"))
##D samp <- setSampling(Terminal = Ter, n = N)
##D yuima <- setYuima(model = mod, sampling = setSampling(Terminal = Ter, n = 50*N))
##D simu.yuima <- simulate(yuima, xinit = c(1,1), true.parameter = list(alpha1=-2, alpha2=-1, 
##D                        beta1=1, beta2=1, beta3=1, beta4=2), subsampling = samp)
##D Xt <- matrix(0,(N+1),2)
##D for(i in 1:(N+1)){
##D   Xt[i,] <- simu.yuima@data@original.data[50*(i-1)+1,]
##D }
##D 
##D ## Parameter settings
##D para.init <- list(alpha1 = runif(1,min=-3,max=-1), alpha2 = runif(1,min=-2,max=0), 
##D                   alpha3 = runif(1,min=-1,max=1), beta1 = runif(1,min=0,max=2), 
##D                   beta2 = runif(1,min=0,max=2), beta3 = runif(1,min=0,max=2), 
##D                   beta4 = runif(1,min=1,max=3))
##D para.low <- list(alpha1 = -5, alpha2 = -5, alpha3 = -5, beta1 = 0, beta2 = 0, beta3 = 0, beta4 = 0)
##D para.upp <- list(alpha1 = 5, alpha2 = 5, alpha3 = 5, beta1 = 5, beta2 = 5, beta3 = 5, beta4 = 5)
##D 
##D ## Ex.2.1 
##D diff.coef.matrix1 <- matrix(c("beta1+1", "beta3*x1", "-beta2*x1", "beta4+1"), 2, 2)
##D drif.coef.vec1 <- c("alpha1*x1", "alpha2*x2+alpha3")
##D mod1 <- setModel(drift = drif.coef.vec1, diffusion = diff.coef.matrix1, 
##D                  state.variable = c("x1", "x2"), solve.variable = c("x1", "x2"))
##D samp1 <- setSampling(Terminal=Ter, n = N)
##D yuima1 <- setYuima(model=mod1, sampling=samp1)
##D ic1 <- IC(yuima1, data=Xt, start=para.init, upper=para.upp, lower=para.low, rcpp=TRUE)
##D ic1
##D 
##D ## Ex.2.2 
##D diff.coef.matrix2 <- matrix(c("beta1+1", "beta3*x1", "-beta2*x1", "beta4+1"), 2, 2)
##D drif.coef.vec2 <- c("alpha1*x1", "alpha2*x2")
##D mod2 <- setModel(drift = drif.coef.vec2, diffusion = diff.coef.matrix2, 
##D                  state.variable = c("x1", "x2"), solve.variable = c("x1", "x2"))
##D samp2 <- setSampling(Terminal=Ter, n = N)
##D yuima2 <- setYuima(model=mod2, sampling=samp2)
##D ic2 <- IC(yuima2, data=Xt, start=para.init, upper=para.upp, lower=para.low, rcpp=TRUE)
##D ic2
## End(Not run)




