library(sppmix)


### Name: plot.damcmc_res
### Title: Plot results from a DAMCMC fit
### Aliases: plot.damcmc_res

### ** Examples

## No test: 
fit <- est_mix_damcmc(pp = spatstat::redwood, m = 10)
plot(fit)
#Tornadoes
Tornfit=est_mix_damcmc(Tornadoes2011MO, m=5, L = 20000)
MAPsurf=GetMAPEst(Tornfit)
ret=PlotUSAStates(states=c('Iowa','Arkansas', 'Missouri','Illinois','Indiana',
 'Kentucky','Tennessee', 'Kansas','Nebraska','Texas','Oklahoma','Mississippi',
 'Alabama','Louisiana'),showcentroids=FALSE, shownames=TRUE, plotlevels = FALSE,
 main="Tornadoes about MO, 2011", pp=Tornadoes2011MO, surf=MAPsurf,
 boundarycolor="white", namescolor="white")
print(ret)
plot(Tornfit)
# get the intensity of posterior means
post_mean = GetPMEst(Tornfit)
# plot the estimated intensity surface
plot(post_mean)
#check labels
check_labels(Tornfit)
# If present then fix label switching, start with approx=TRUE
post_fixed = FixLS_da(Tornfit, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed,separate = FALSE)
## End(No test)




