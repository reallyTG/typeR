library(pez)


### Name: plot.comparative.comm
### Title: Dot-plots of community presence/absence or abundance
### Aliases: plot.comparative.comm

### ** Examples

data(laja)
data <- comparative.comm(invert.tree, river.sites, invert.traits)
plot(data)
plot(data, sites=c("AT", "BP"), fraction=1.5)
settings <- plot(data, sites=c("AT", "BP"), site.col=rainbow(2), fraction=1.5)
plot(data, sites=c("AT", "BP"), site.col=rainbow(2),
fraction=1.2, x.increment=settings$x.increment/4)
#dot.cex isn't as scary as it sounds...
plot(data, site.col=rainbow(2), fraction=1.2, abundance=TRUE, dot.cex=sqrt)
#...or other trivial variants...
abund.sqrt <- function(x) ifelse(x>0, sqrt(x), 0)
plot(data, sites=c("AT", "BP"), site.col=rainbow(2), fraction=1.2,
x.increment=settings$x.increment/4, abundance=TRUE, dot.cex=abund.sqrt)
plot(data, sites=c("AT", "BP"), site.col=rainbow(2), fraction=1.2,
x.increment=settings$x.increment/4, abundance=TRUE, dot.cex=function(x) sqrt(x))



