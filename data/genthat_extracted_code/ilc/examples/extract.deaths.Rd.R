library(ilc)


### Name: extract.deaths
### Title: Miscellaneous utility functions for 'demogdata' type mortality
###   data
### Aliases: extract.deaths
### Keywords: method

### ** Examples

# 'observed' number of deaths (i.e. no data correction)
extract.deaths(dd.cmi.pens, ages=55:100)
# number of deaths with corrections using Perks mortality model
tmp.d <- extract.deaths(dd.cmi.pens, ages=55:100, fill='perks')
# Note: to further improve the plot the user can change the vertical
# axis label and/or main title (amongst other plotting parameters).
plot(tmp.d, transf=FALSE, ylab='Number of Deaths')    # change ylab
plot_dd(tmp.d, transf=FALSE, ylab='Number of Deaths', lpar=list(x.int=-0.2, y.int=0.9, cex=0.85))
plot_dd(tmp.d, y=1995:2003, transf=FALSE, lty=1:5, ylab='Number of Deaths',
  main=paste(tmp.d$lab, ": male (1995-2003)", sep='')) # change main title



