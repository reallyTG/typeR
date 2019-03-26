library(ltbayes)


### Name: fmodel2pp
### Title: Latent Trait Posterior of the Two-Parameter Binary Probit Model
### Aliases: fmodel2pp

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

alph <- rep(1, 5)   # discrimination parameters
beta <- -2:2        # difficulty parameters

post <- postsamp(fmodel2pp, c(1,1,0,0,0), 
	apar = alph, bpar = beta,
	control = list(nbatch = samp + burn))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodel2pp, c(1,1,0,0,0), 
	apar = alph, bpar = beta),
	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodel2pp, c(1,1,0,0,0), 
	apar = alph, bpar = beta) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodel2pp, c(1,1,0,0,0), 
	apar = alph, bpar = beta) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodel2pp, c(1,1,0,0,0), apar = alph, 
	bpar = beta) # profile likelihood confidence interval



