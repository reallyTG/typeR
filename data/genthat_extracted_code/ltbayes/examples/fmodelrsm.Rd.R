library(ltbayes)


### Name: fmodelrsm
### Title: Latent Trait Posterior of the Rating Scale Model
### Aliases: fmodelrsm

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

gamm <- c(0, 0)
delt <- rep(0, 5)

post <- postsamp(fmodelrsm, c(0,1,2,1,0), cpar = gamm, dpar = delt,
	control = list(nbatch = samp + burn))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodelrsm, c(0,1,2,1,0), cpar = gamm, dpar = delt),
	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodelrsm, c(0,1,2,1,0), cpar = gamm, dpar = delt) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodelrsm, c(0,1,2,1,0), cpar = gamm, dpar = delt) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodelrsm, c(0,1,2,1,0),
	cpar = gamm, dpar = delt) # profile likelihood confidence interval



