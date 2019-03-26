library(smatr)


### Name: slope.com
### Title: Common slope test amongst several allometric lines
### Aliases: slope.com
### Keywords: htest

### ** Examples

#load leaf longevity data
data(leaflife)

#plot the data, with different symbols for different groups.
plot(leaflife$lma, leaflife$longev, type='n', log='xy', xlab=
   'leaf mass per area [log scale]', ylab='leaf longevity [log scale]')
colours <- c('blue', 'red', 'green', 'yellow')
points(leaflife$lma, leaflife$longev,
   col=colours[as.numeric(leaflife$site)])
legend(55, 5, as.character(unique(leaflife$site)), col=colours,
   pch=rep(1,4))

#test for common SMA slope of log(leaf longevity) vs log(LMA),
#across species sampled at different sites:
fit <- with(leaflife, slope.com(log10(longev), log10(lma), site))
fit

#Residual vs fits plots for SMA fit of each site
y <- log10(leaflife$longev)
x <- log10(leaflife$lma)
site <- leaflife$site
par( mfrow=c(2,2) )
plot(y[site==1] + fit$bs[1,1] * x[site==1], y[site==1] - fit$bs[1,1] 
   * x[site==1], xlab='fits (site 1)', ylab='residuals (site 1)')
plot(y[site==2] + fit$bs[1,2] * x[site==2], y[site==2] - fit$bs[1,2]
   * x[site==2], xlab='fits (site 2)', ylab='residuals (site 2)')
plot(y[site==3] + fit$bs[1,3] * x[site==3], y[site==3] - fit$bs[1,3]
   * x[site==3], xlab='fits (site 3)', ylab='residuals (site 3)')
plot(y[site==4] + fit$bs[1,4] * x[site==4], y[site==4] - fit$bs[1,4]
   * x[site==4], xlab='fits (site 4)', ylab='residuals (site 4)')

#Test for common SMA slope amongst species at low rainfall sites
#with different levels of soil nutrients
leaf.low.rain <- leaflife[leaflife$rain=='low',]
with(leaf.low.rain, slope.com(log10(longev), log10(lma), soilp))

#test for common MA slope:
with(leaflife, slope.com(log10(longev), log10(lma), site, method='MA'))

#test for common MA slope, and produce a 90% CI for the common slope:
with(leaflife, slope.com(log10(longev), log10(lma), site,  method='MA', alpha=0.1))




