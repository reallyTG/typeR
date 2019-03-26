library(gamlss.add)


### Name: plot.nnet
### Title: Plotting fitted neural networks
### Aliases: plot.nnet
### Keywords: regression

### ** Examples

r1 <- gamlss(R~nn(~Fl+A+H+loc, size=10, decay=0.2), data=rent, 
      family=GA, gd.tol=1000, n.cyc=5)
getSmo(r1)
plot(getSmo(r1), y.lab=expression(eta[1]))
plot(getSmo(r1), y.lab=expression(g[1](mu)))
## Not run: 
##D r2 <- gamlss(R~nn(~Fl+A+H+loc, size=10, decay=0.2), 
##D       sigma.fo=~nn(~Fl+A+H+loc, size=10, decay=0.2),data=rent, 
##D       family=GA, gd.tol=1000, n.cyc=5)
##D plot(getSmo(r2), y.lab=expression(g[1](mu)))
##D plot(getSmo(r2, what="sigma"), y.lab=expression(g[2](sigma)))
## End(Not run)



