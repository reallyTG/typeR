library(msde)


### Name: sde.post
### Title: MCMC sampler for the SDE posterior.
### Aliases: sde.post

### ** Examples

## No test: 
# Posterior inference for Heston's model
hmod <- sde.examples("hest") # load pre-compiled model

# Simulate data
X0 <- c(X = log(1000), Z = 0.1)
theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)
dT <- 1/252
nobs <- 1000
hest.sim <- sde.sim(model = hmod, x0 = X0, theta = theta,
                    dt = dT, dt.sim = dT/10, nobs = nobs)

# initialize MCMC sampler
# both components observed, no missing data between observations
init <- sde.init(model = hmod, x = hest.sim$data,
                 dt = hest.sim$dt, theta = theta)

# Initialize posterior sampling argument
nsamples <- 1e4
burn <- 1e3
hyper <- NULL # flat prior
hest.post <- sde.post(model = hmod, init = init, hyper = hyper,
                      nsamples = nsamples, burn = burn)

# plot the histogram for the sampled parameters
par(mfrow = c(2,3))
for(ii in 1:length(hmod$param.names)) {
  hist(hest.post$params[,ii],breaks=100, freq = FALSE,
       main = parse(text = hmod$param.names[ii]), xlab = "")
}
## End(No test)



