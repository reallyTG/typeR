library(sac)


### Name: schapt
### Title: Semiparametric Analysis of Changepoint
### Aliases: schapt
### Keywords: htest robust

### ** Examples

require(sac) #load the package
# one-change alternative
## Nile data with one change-point: the annual flows drop in 1898.
## It is believed to be caused by the building of the first Aswan dam.
if(! "package:sac" %in% search()) library(sac) 
    #if package sac has not been loaded, load it.
if(! "package:stats" %in% search()) library(stats)
data(Nile)
plot(Nile, type="p")
schapt(Nile, alternative = "one.change")



