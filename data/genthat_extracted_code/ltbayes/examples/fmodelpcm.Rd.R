library(ltbayes)


### Name: fmodelpcm
### Title: Latent Trait Posterior for the Partial Credit Model
### Aliases: fmodelpcm

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

beta <- matrix(0, 5, 2)

post <- postsamp(fmodelpcm, c(0,1,2,1,0), bpar = beta, 
	control = list(nbatch = samp + burn))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodelpcm, c(0,1,2,1,0), bpar = beta),
	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodelpcm, c(0,1,2,1,0), bpar = beta) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodelpcm, c(0,1,2,1,0), bpar = beta) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodelpcm, c(0,1,2,1,0), bpar = beta) # profile likelihood confidence interval



