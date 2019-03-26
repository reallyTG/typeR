library(RBesT)


### Name: plot.mix
### Title: Plot mixture distributions
### Aliases: plot.mix

### ** Examples

# beta with two informative components
bm <- mixbeta(inf=c(0.5, 10, 100), inf2=c(0.5, 30, 80))
plot(bm)
plot(bm, fun=pmix)

# for customizations of the plot we need to load ggplot2 first
library(ggplot2)

# show a histogram along with the density
plot(bm) + geom_histogram(data=data.frame(x=rmix(bm, 1000)),
                          aes(y=..density..), bins=50, alpha=0.4)

## Not run: 
##D # note: we can also use bayesplot for histogram plots with a density ...
##D library(bayesplot)
##D mh <- mcmc_hist(data.frame(x=rmix(bm, 1000)), freq=FALSE) +
##D          overlay_function(fun=dmix, args=list(mix=bm))
##D # ...and even add each component
##D for(k in 1:ncol(bm))
##D   mh <- mh + overlay_function(fun=dmix, args=list(mix=bm[[k]]), linetype=I(2))
##D print(mh)
## End(Not run)

# normal mixture
nm <- mixnorm(rob=c(0.2, 0, 2), inf=c(0.8, 6, 2), sigma=5)
plot(nm)
plot(nm, fun=qmix)

# obtain ggplot2 object and change title
pl <- plot(nm)
pl + ggtitle("Normal 2-Component Mixture")




