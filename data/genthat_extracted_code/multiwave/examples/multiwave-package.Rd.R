library(multiwave)


### Name: multiwave-package
### Title: Estimation of multivariate long-memory models parameters: memory
###   parameters and long-run covariance matrix (also called fractal
###   connectivity).
### Aliases: multiwave-package multiwave
### Keywords: package

### ** Examples


rho<-0.4
cov <- matrix(c(1,rho,rho,1),2,2)
d<-c(0.4,0.2)
J <- 9
N <- 2^J

resp <- fivarma(N, d, cov_matrix=cov)

x <- resp$x
long_run_cov <- resp$long_run_cov

#### Compute wavelets this is also included in the functions without _wav
res_filter <- scaling_filter('Daubechies',8);
filter <- res_filter$h
M <- res_filter$M
alpha <- res_filter$alpha

LU <- c(1,11)

if(is.matrix(x)){
    N <- dim(x)[1]
    k <- dim(x)[2]
}else{
    N <- length(x)
    k <- 1
}
mat_x <- as.matrix(x,dim=c(N,k))

## Wavelet decomposition
xwav <- matrix(0,N,k)
    for(j in 1:k){
        xx <- mat_x[,j]   
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
res_psi <- psi_hat_exact(filter,J)
psih<-res_psi$psih
grid<-res_psi$grid


##### Estimate using Fourier #############

m <- floor(N^{0.65}) ## default value of Shimotsu
res_mfw <- mfw(x,m)
res_d_mfw<-res_mfw$d
res_rho_mfw<-res_mfw$cov[1,2]

### Eval MFW

res_mfw_eval <- mfw_eval(d,x,m)
res_mfw_cov_eval <- mfw_cov_eval(d,x,m)

###### Estimate using Wavelets #############

## Using xwav 

if(dim(xwav)[2]==1) xwav<-as.vector(xwav)
res_mww_wav <- mww_wav(xwav,index,psih,grid,LU)

### Eval MWW_wav

res_mww_wav_eval <- mww_wav_eval(d,xwav,index,LU)
res_mww_wav_cov_eval <- mww_wav_cov_eval(d,xwav,index,psih,grid,LU)

## Using directly the time series

res_mww <- mww(x,filter,LU)
res_d_mww<-res_mww$d
res_rho_mww<-res_mww$cov[1,2]

### Eval MWW_wav

res_mww_eval <- mww_eval(d,x,filter,LU)
res_mww_cov_eval <- mww_cov_eval(d,x,filter,LU)




