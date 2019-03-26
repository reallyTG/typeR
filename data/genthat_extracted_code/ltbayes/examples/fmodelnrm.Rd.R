library(ltbayes)


### Name: fmodelnrm
### Title: Latent Trait Posterior of the Nominal Response Model
### Aliases: fmodelnrm

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

alph <- matrix(c(-1, 0, 1), 5, 3, byrow = TRUE)
beta <- matrix(0, 5, 3)

post <- postsamp(fmodelnrm, c(0,1,2,1,0), 
	apar = alph, bpar = beta, control = list(nbatch = samp + burn))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodelnrm, c(0,1,2,1,0), apar = alph, bpar = beta),
	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodelnrm, c(0,1,2,1,0), apar = alph, bpar = beta) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodelnrm, c(0,1,2,1,0), apar = alph, bpar = beta) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodelnrm, c(0,1,2,1,0), 
   apar = alph, bpar = beta) # profile likelihood confidence interval



