library(mclcar)


### Name: rsmMCL
### Title: Response surface method for maximising the Monte Carlo
###   likelihood
### Aliases: rsmMCL
### Keywords: CAR Spatial Monte Carlo likelihood Response surface design

### ** Examples

#### Poisson glm with CAR latent variables
## Simulate some data
set.seed(33)
n.torus <- 10
nb <- 30
rho <- 0.2
sigma <- 1.5
beta <- c(1, 1)
pars.true <- c(rho, sigma, beta)
X0 <- cbind(rep(1, n.torus^2), sample(log(1:n.torus^2)/5))
mydata3 <- CAR.simGLM(method = "poisson", n = c(n.torus, n.torus),
                      pars = pars.true, Xs =as.matrix(X0))

## Fit by rsm
rsm.mcmle2 <- rsmMCL(data = mydata3, psi0 = c(0, 1, 2, 2), family = "poisson",
                     control = list(n.iter = 2, trace.all = TRUE),
                     mc.control = list(N.Zy = 1e3, Scale = 1.65/(n.torus^(2/6)),
                                       thin = 5, burns = 5e2,
                                       method = "mala", scale.fixed = TRUE))
summary(rsm.mcmle2, family = "poisson",  mc.covar=TRUE)
plot(rsm.mcmle2, family = "poisson")



