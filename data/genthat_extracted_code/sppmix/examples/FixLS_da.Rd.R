library(sppmix)


### Name: FixLS_da
### Title: Fix Label Switching
### Aliases: FixLS_da

### ** Examples

## No test: 
# generate data
mix1 <- normmix(ps=c(.4, .2,.4), mus=list(c(0.3, 0.3), c(.5,.5),c(0.7, 0.7)),
 sigmas = list(.02*diag(2),.05*diag(2), .02*diag(2)),lambda = 100, win = spatstat::square(1))
#plot the true mixture
plot(mix1,main = "True Poisson intensity surface (mixture of normal components)")
pp1 <- rsppmix(mix1)
# Run Data augmentation MCMC and get posterior realizations
postfit = est_mix_damcmc(pp1, m=3, truncate=TRUE)
#plot the chains
plot_chains(postfit)
plot_chains(postfit,separate = FALSE)
# get the intensity of posterior means
post_mean = GetPMEst(postfit)
# plot the estimated intensity surface
plot(post_mean)
#check labels
check_labels(postfit)
# Fix label switching, start with approx=TRUE
post_fixed = FixLS_da(postfit, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed, separate = FALSE)
#this one works better in theory
post_fixed = FixLS_da(postfit, approx=FALSE, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed, separate = FALSE)
## End(No test)




