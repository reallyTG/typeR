library(sppmix)


### Name: check_labels
### Title: Check for label switching
### Aliases: check_labels

### ** Examples

## No test: 
# generate data
mix1 = normmix(ps=c(.4, .2,.4), mus=list(c(0.3, 0.3), c(.5,.5),c(0.7, 0.7)),
 sigmas = list(.02*diag(2),.05*diag(2), .02*diag(2)),lambda = 100,
 win = spatstat::square(1))
plot(mix1,main="True Poisson intensity surface (mixture of normal components)")
pp1 = rsppmix(mix1)
# Run Data augmentation MCMC and get posterior realizations
postfit = est_mix_damcmc(pp1,m=5)
#plot the chains
plot_chains(postfit)
#check labels
check_labels(postfit)
#plot the average posterior surface
plot(GetPMEst(postfit))
#plot the surface of posterior means, can be slow for large LL
avgsurf=plot_avgsurf(postfit, LL = 50, burnin = 1000)
# Fix label switching, start with approx=TRUE
post_fixed = FixLS_da(postfit, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed,separate = FALSE)
#this one works better in theory
post_fixed = FixLS_da(postfit,approx=FALSE, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed,separate = FALSE)
## End(No test)




