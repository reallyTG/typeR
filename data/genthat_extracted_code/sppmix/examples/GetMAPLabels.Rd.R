library(sppmix)


### Name: GetMAPLabels
### Title: Retrieve the MAP estimates for the component labels
### Aliases: GetMAPLabels

### ** Examples

## No test: 
truemix <- normmix(ps=c(.4, .2,.4), mus=list(c(0.3, 0.3), c(.5,.5),c(0.7, 0.7)),
 sigmas = list(.02*diag(2), .05*diag(2), .01*diag(2)))
intsurf=to_int_surf(truemix,lambda = 100, win = spatstat::square(1))
pp1 <- rsppmix(intsurf)
plot(pp1)
plot(pp1, mus = intsurf$mus)#plot the mixture means as well
#plot the points with different colors depending on the true component label
plot(pp1, colors = TRUE)
#plot the points with different colors depending on the estimated component label
fit <- est_mix_damcmc(pp1, 3)
est_comp <- GetMAPLabels(fit)
plot(pp1, estcomp = est_comp, colors = TRUE)
fitBD <- est_mix_bdmcmc(pp1, 5)
est_compBD <- GetMAPLabels(fitBD)
plot(pp1, estcomp = est_compBD, colors = TRUE)
## End(No test)




