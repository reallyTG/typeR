library(RSEIS)


### Name: sigconvGR
### Title: convolve for Ground roll
### Aliases: sigconvGR
### Keywords: misc

### ** Examples


S1 <- symshot1()
dt <- S1$dt
###########    these are the reflections S1$GRrec

d <- dim(S1$smograms)
G1 <- matrix( rep(0, length=d[1]*d[2]), ncol=d[2], nrow=d[1])

###   these are the refractions S1$THEORY$trefrac
p <- round( S1$THEORY$trefrac[1,]/S1$dt );
G1[cbind(p , 1:d[2])  ] <- 1


#### plot the spikes
wiggleimage(0.1*G1, dt = -S1$dt, dx = S1$x, col = "black")

grlen <- floor(.6/dt)
fgr <- 10
tape <- applytaper( rep(1, grlen), p = 0.2)
tgr <- seq(from=0, by=dt, length=grlen)
siggr <- tape*sin(2*pi*fgr*tgr)

##############  convolve the wavelet with the set of spikes
H1 <- sigconvGR(G1, siggr, dt)

############  plot
wiggleimage(0.1*H1, dt = -S1$dt, dx = S1$x, col = "black")




