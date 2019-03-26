library(ltbayes)


### Name: fmodel1pl
### Title: Latent Trait Posterior of the One-Parameter Binary Logistic
###   Model
### Aliases: fmodel1pl

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

beta <- -2:2        # difficulty parameters

post <- postsamp(fmodel1pl, c(1,1,0,0,0), 
	bpar = beta, control = list(nbatch = samp + burn))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodel1pl, c(1,1,0,0,0), 
	bpar = beta),	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodel1pl, c(1,1,0,0,0), bpar = beta) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodel1pl, c(1,1,0,0,0), bpar = beta) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodel1pl, c(1,1,0,0,0), bpar = beta) # profile likelihood confidence interval



