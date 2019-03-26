library(ltbayes)


### Name: fmodelgrl
### Title: Latent Trait Posterior of the Logistic Graded Response Model
### Aliases: fmodelgrl

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

alph <- rep(1, 3)                           # discrimination parameters
beta <- matrix(c(-1,1), 3, 2, byrow = TRUE) # difficulty parameters

post <- postsamp(fmodelgrl, c(0,1,2), 
	apar = alph, bpar = beta,
	control = list(nbatch = samp + burn))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodelgrl, c(0,1,2), 
	apar = alph, bpar = beta),
	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodelgrl, c(0,1,2), 
	apar = alph, bpar = beta) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodelgrl, c(0,1,2), 
	apar = alph, bpar = beta) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodelgrl, c(0,1,2), apar = alph, 
	bpar = beta) # profile likelihood confidence interval



