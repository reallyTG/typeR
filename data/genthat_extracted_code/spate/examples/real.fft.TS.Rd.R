library(spate)


### Name: real.fft.TS
### Title: Fast calculation of the two-dimensional real Fourier transform
###   of a space-time field. For each time point, the spatial field is
###   transformed.
### Aliases: real.fft.TS

### ** Examples

n <- 100
T <- 4
spec <- matern.spec(wave=spate.init(n=n,T=1)$wave,n=n,rho0=0.05,sigma2=1,norm=TRUE)
specsim <- matrix(0,nrow=T,ncol=n*n)
for(t in 1:T) specsim[t,] <- rnorm(n*n)*sqrt(spec)
maternsim <- vect.to.TSmat(real.fft.TS(TSmat.to.vect(specsim),n=n,T=T,inv=FALSE),T=T)
par(mfrow=c(2,2))
for(t in 1:T) image(1:n,1:n,matrix(maternsim[t,],nrow=n),
                    main="Sample from Matern field",xlab="",ylab="")



