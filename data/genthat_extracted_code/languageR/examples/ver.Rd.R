library(languageR)


### Name: ver
### Title: The Dutch prefix ver-: semantic transparency and frequency
### Aliases: ver
### Keywords: datasets

### ** Examples
## Not run: 
##D data(ver)
##D ver$Frequency = log(ver$Frequency)
##D 
##D plot(density(ver$Frequency))
##D 
##D # plot separate densities for opaque and transparent words
##D 
##D ver.transp = ver[ver$SemanticClass == "transparent",]$Frequency
##D ver.opaque = ver[ver$SemanticClass == "opaque", ]$Frequency
##D 
##D ver.transp.d = density(ver.transp)
##D ver.opaque.d = density(ver.opaque)
##D xlimit = range(ver.transp.d$x, ver.opaque.d$x)
##D ylimit = range(ver.transp.d$y, ver.opaque.d$y)
##D plot(ver.transp.d, lty = 1, col = "black", 
##D   xlab = "frequency", ylab = "density", 
##D   xlim = xlimit, ylim = ylimit, main = "")
##D lines(ver.opaque.d, col = "darkgrey")
##D legend(6,0.25, lty=rep(1,2), col=c("black", "darkgrey"), 
##D legend=c("transparent", "opaque"))
##D 
##D # test whether the difference is significant
##D 
##D ks.test(jitter(ver.transp), jitter(ver.opaque))
## End(Not run)


