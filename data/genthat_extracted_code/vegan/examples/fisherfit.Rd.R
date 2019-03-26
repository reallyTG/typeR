library(vegan)


### Name: fisherfit
### Title: Fit Fisher's Logseries and Preston's Lognormal Model to
###   Abundance Data
### Aliases: fisherfit as.fisher plot.fisherfit prestonfit prestondistr
###   as.preston plot.prestonfit lines.prestonfit plot.preston
###   lines.preston plot.fisher veiledspec
### Keywords: univar distribution

### ** Examples

data(BCI)
mod <- fisherfit(BCI[5,])
mod
# prestonfit seems to need large samples
mod.oct <- prestonfit(colSums(BCI))
mod.ll <- prestondistr(colSums(BCI))
mod.oct
mod.ll
plot(mod.oct)  
lines(mod.ll, line.col="blue3") # Different
## Smoothed density
den <- density(log2(colSums(BCI)))
lines(den$x, ncol(BCI)*den$y, lwd=2) # Fairly similar to mod.oct
## Extrapolated richness
veiledspec(mod.oct)
veiledspec(mod.ll)



