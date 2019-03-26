library(multiwave)


### Name: mww_wav_cov_eval
### Title: multivariate wavelet Whittle estimation of the long-run
###   covariance matrix
### Aliases: mww_wav_cov_eval
### Keywords: ts nonparametric

### ** Examples

### Simulation of ARFIMA(0,d,0)
rho<-0.4
cov <- matrix(c(1,rho,rho,1),2,2)
d<-c(0.4,0.2)
J <- 9
N <- 2^J

resp <- fivarma(N, d, cov_matrix=cov)
x <- resp$x
long_run_cov <- resp$long_run_cov

## wavelet coefficients definition
res_filter <- scaling_filter('Daubechies',8);
filter <- res_filter$h
M <- res_filter$M
alpha <- res_filter$alpha

LU <- c(2,11)

### wavelet decomposition

if(is.matrix(x)){
     N <- dim(x)[1]
     k <- dim(x)[2]
}else{
     N <- length(x)
     k <- 1
}
x <- as.matrix(x,dim=c(N,k))

     ## Wavelet decomposition
     xwav <- matrix(0,N,k)
     for(j in 1:k){
          xx <- x[,j]
             
          resw <- DWTexact(xx,filter)
          xwav_temp <- resw$dwt
          index <- resw$indmaxband
          Jmax <- resw$Jmax
          xwav[1:index[Jmax],j] <- xwav_temp;
     }
     ## we free some memory
     new_xwav <- matrix(0,min(index[Jmax],N),k)
     if(index[Jmax]<N){
          new_xwav[(1:(index[Jmax])),] <- xwav[(1:(index[Jmax])),]
     }
     xwav <- new_xwav
     index <- c(0,index)

##### Compute the wavelet functions 
res_psi <- psi_hat_exact(filter,10)
psih<-res_psi$psih
grid<-res_psi$grid

res_mww <- mww_wav_cov_eval(d,xwav,index, psih, grid,LU)




