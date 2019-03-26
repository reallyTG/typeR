library(BurStFin)


### Name: alpha.proxy
### Title: Compute and Plot Alpha Proxy
### Aliases: alpha.proxy
### Keywords: dplot

### ** Examples

# return vector of alpha proxies
alpha.proxy(weigh=.05, vol.man=.17, cor.man=seq(0, .2, len=21))

# create a contour plot
alpha.proxy(weigh=.05, vol.man=seq(.15, .25, len=20), 
	cor.man=seq(0, .2, len=21))

# commands used to create figures in the paper
alpha.proxy(vol.man=seq(.15, .25, len=50), weight=seq(.01, .7, leng=60), 
        color.palette=partial.rainbow(start=0, end=.32))

alpha.proxy(cor.man=seq(0, .3, len=50), weight=seq(.01, .7, leng=60), 
        color.palette=partial.rainbow(start=.07))

alpha.proxy(cor.man=seq(0, .3, len=50), vol.man=seq(.15, .25, leng=60), 
        color.palette=partial.rainbow(start=0))



