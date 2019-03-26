library(CepLDA)


### Name: recon
### Title: Convert Cepstral Coefficients into Log-Spectra.
### Aliases: recon

### ** Examples

## Simulate dataset
nj = 50  #number of series in training data
N = 500  #length of time series
data1 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.01,.7),r.phi2=c(-.12,-.06),r.sig2=c(.3,3))
data2 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.5,1.2),r.phi2=c(-.36,-.25),r.sig2=c(.3,3))
data3 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.9,1.5),r.phi2=c(-.56,-.75),r.sig2=c(.3,3))
dat <- cbind(data1$X,data2$X,data3$X)
y <- c(rep(1,nj),rep(2,nj),rep(3,nj))
data.cep <- cep.get(y,dat,4,7)

## Convert cepstral coefficients into log-spectra
frqs <- seq(from=0, to=.5, by=1/(dim(data.cep)[2]-1))
lspec <- matrix(0,dim(data.cep)[1], length(frqs))
## rows of lspec matrix contains log-spectra
for(i in 1:dim(data.cep)[1]){
  lspec[i,] <- recon(data.cep[,i],frqs)
}



