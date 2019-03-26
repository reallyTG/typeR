library(evmix)


### Name: hillplot
### Title: Hill Plot
### Aliases: hillplot

### ** Examples

## Not run: 
##D # Reproduce graphs from Figure 2.4 of Resnick (1997)
##D data(danish, package="evir")
##D par(mfrow = c(2, 2))
##D 
##D # Hill plot
##D hillplot(danish, y.alpha=TRUE, ylim=c(1.1, 2))
##D 
##D # AltHill plot
##D hillplot(danish, y.alpha=TRUE, x.theta=TRUE, ylim=c(1.1, 2))
##D 
##D # AltSmooHill plot
##D hillplot(danish, hill.type="SmooHill", r=3, y.alpha=TRUE, x.theta=TRUE, ylim=c(1.35, 1.85))
##D 
##D # AltHill and AltSmooHill plot (no CI's or legend)
##D hillout = hillplot(danish, hill.type="SmooHill", r=3, y.alpha=TRUE, 
##D  x.theta=TRUE, try.thresh = c(), alpha=NULL, ylim=c(1.1, 2), legend.loc=NULL, lty=2)
##D n = length(danish)
##D with(hillout[3:n,], lines(log(ks)/log(n), 1/H, type="s"))
## End(Not run)



