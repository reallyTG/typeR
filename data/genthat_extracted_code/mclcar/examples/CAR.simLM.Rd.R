library(mclcar)


### Name: CAR.simLM
### Title: Simulate samples from a CAR model.
### Aliases: CAR.simLM CAR.simGLM CAR.simTorus CAR.simWmat
### Keywords: CAR Monte Carlo likelihood

### ** Examples

## Simulate CAR data on a torus
set.seed(33)
n.torus <- 10
rho <- 0.2
sigma <- 1.5
prec <- 1/sigma
beta <- c(1, 1)
XX <- cbind(rep(1, n.torus^2), sample(log(1:n.torus^2)/5))
mydata1 <- CAR.simTorus(n1 = n.torus, n2 = n.torus, rho = rho, prec = prec)

## Simulate CAR data for a given spatial weight matrix
Wmat <- mydata1$W
mydata2 <- CAR.simWmat(rho = rho, prec = prec, W = Wmat)

## Simualte data from a linear model with CAR error
y <- XX %*% beta + mydata1$X
mydata1$data.vec <- data.frame(y=y, XX[,-1])
mydata3 <- CAR.simLM(pars = c(0.1, 1, 2, 0.5), data = mydata1)

## Simulate Binomial data with CAR latent variables
mydata4 <- CAR.simGLM(method="binom", n=c(10,10), pars = c(rho, sigma,
                      beta), Xs=XX, n.trial = 5)



