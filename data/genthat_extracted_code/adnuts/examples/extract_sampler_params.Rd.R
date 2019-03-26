library(adnuts)


### Name: extract_sampler_params
### Title: Extract sampler parameters from a fit.
### Aliases: extract_sampler_params

### ** Examples

fit <- readRDS(system.file('examples', 'fit_tmb.RDS', package='adnuts'))
## Examine how step size and treedepth changes as the mass matrix updates
## during warmup
sp <- extract_sampler_params(fit, inc_warmup=TRUE)
plot(0,0, type='n', xlim=c(0,510), ylim=c(0,3), xlab='Iteration',
     ylab='Step size (eps)')
for(i in 1:3) lines(1:1000, sp[sp$chain==i,4], col=i)
legend('topright', cex=.7, legend=paste("chain1", 1:3), lty=1, col=1:3)
plot(0,0, type='n', xlim=c(0,1000), ylim=c(0,10), xlab='Iteration',
     ylab='Treedepth')
for(i in 1:3) lines(1:1000, sp[sp$chain==i,5], col=i)
legend('topright', cex=.7, legend=paste("chain1", 1:3), lty=1, col=1:3)




