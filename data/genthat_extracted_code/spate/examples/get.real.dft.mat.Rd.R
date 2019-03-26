library(spate)


### Name: get.real.dft.mat
### Title: Matrix applying the two-dimensional real Fourier transform.
### Aliases: get.real.dft.mat

### ** Examples

##Example nr. 1: sampling from a Matern field
n <- 50
spateFT <- spate.init(n=n,T=1)
spec <- matern.spec(wave=spateFT$wave,n=n,rho0=0.05,sigma2=1,norm=TRUE)
Phi <- get.real.dft.mat(wave=spateFT$wave, indCos=spateFT$indCos, n=n)
sim <- Phi %*% (sqrt(spec)*rnorm(n*n))
image(1:n,1:n,matrix(sim,nrow=n),main="Sample from Matern field",xlab="",ylab="")

##Example nr. 2: image reconstruction
n <- 50##Number of points on each axis
##Low-dimensional: only 41 Fourier functions
spateFT <- spate.init(n=n,T=17,NF=45)
Phi.LD <- get.real.dft.mat(wave=spateFT$wave, indCos=spateFT$indCos, ns=spateFT$ns, n=n)
##Mid-dimensional: 545 (of potentially 2500) Fourier functions
spateFT <- spate.init(n=n,T=17,NF=101)
Phi.MD <- get.real.dft.mat(wave=spateFT$wave, indCos=spateFT$indCos, ns=spateFT$ns, n=n)
##High-dimensional: all 2500 Fourier functions
spateFT <- spate.init(n=n,T=17,NF=2500)
Phi.HD <- get.real.dft.mat(wave=spateFT$wave, indCos=spateFT$indCos, ns=spateFT$ns, n=n)
##Define image
image <- rep(0,n*n)
for(i in 1:n){
  for(j in 1:n){    
    image[(i-1)*n+j] <- cos(5*(i-n/2)/n*pi)*sin(5*(j)/n*pi)*(1-abs(i/n-1/2)-abs(j/n-1/2))
  }
}
par(mfrow=c(2,2),mar=c(2,3,2,1))
image(1:n, 1:n, matrix(image, nrow = n),col = cols(),xlab="",ylab="",main="Original image")
##Aply inverse Fourier transform, dimension reduction, and Fourier transform
spec.LD <- t(Phi.LD) %*% image
image.LD <- Phi.LD %*% spec.LD
spec.MD <- t(Phi.MD) %*% image
image.MD <- Phi.MD %*% spec.MD
spec.HD <- t(Phi.HD) %*% image
image.HD <- Phi.HD %*% spec.HD
image(1:n, 1:n, matrix(image.LD, nrow = n),col = cols(),
      xlab="",ylab="",main="45 of 2500 Fourier terms")
image(1:n, 1:n, matrix(image.MD, nrow = n),col = cols(),
      xlab="",ylab="",main="101 of 2500 Fourier terms")
image(1:n, 1:n, matrix(image.HD, nrow = n),col = cols(),
      xlab="",ylab="",main="All 2500 Fourier terms")



