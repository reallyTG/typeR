library(msde)


### Name: sde.init
### Title: MCMC initialization.
### Aliases: sde.init

### ** Examples

# load Heston's model
hmod <- sde.examples("hest")

# generate some observed data
nObs <- 5
x0 <- c(X = log(1000), Z = 0.1)
X0 <- apply(t(replicate(nObs, x0)), 2, jitter)
dT <- .6
theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)

# no missing data
sde.init(model = hmod, x = X0, dt = dT, theta = theta)

# all but endpoint volatilities are missing
sde.init(model = hmod, x = X0, dt = dT, m = 1,
         nvar.obs = c(2, rep(1, nObs-2), 2), theta = theta)

# all volatilities missing,
# two completely missing SDE timepoints between observations
m <- 3 # divide each observation interval into m equally spaced timepoints
sde.init(model = hmod, x = X0, dt = dT,
         m = m, nvar.obs = 1, theta = theta)



