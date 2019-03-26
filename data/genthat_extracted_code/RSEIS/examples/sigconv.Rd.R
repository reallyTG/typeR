library(RSEIS)


### Name: sigconv
### Title: Convolve spikes with wavelets
### Aliases: sigconv
### Keywords: misc

### ** Examples

S1 <- symshot1()

##############   S1$THEORY$treflex

d <- dim(S1$smograms)
G1 <- matrix( rep(0, length=d[1]*d[2]), ncol=d[2], nrow=d[1])

############   set up the spike set for reflexions
for(i in 1:3){
p <- round( S1$THEORY$treflex[i,]/S1$dt );

G1[cbind(p , 1:d[2])  ] <- 1

}

#### plot the spikes
wiggleimage(0.1*G1, dt = -S1$dt, dx = S1$x, col = "black")

###  make a ricker wavelet
wavelet <- genrick(25,S1$dt,35)
klem <- 11
### 
nwave <- RPMG::RESCALE(wavelet, 0, 1, wavelet[1], max(wavelet))

##############  convolve the wavelet with the set of spikes
H1 <- sigconv(G1, nwave)

############  plot
wiggleimage(0.1*H1, dt = -S1$dt, dx = S1$x, col = "black")





