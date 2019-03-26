library(laGP)


### Name: blhs
### Title: Bootstrapped block Latin hypercube subsampling
### Aliases: blhs blhs.loop
### Keywords: design models spatial regression nonparametric

### ** Examples

  # input space based on latin-hypercube sampling (not required)
  library(lhs)
  ## two dimensional example with N=216 sized sample
  X <- randomLHS(216, 2)  
  # pseudo responses, not important for visualizing design
  Y <- runif(216) 
  
  ## BLHS sample with m=6 divisions in each coordinate
  sub <- blhs(y=Y, X=X, m=6)
  Xsub <- sub$xs # the bootstrapped subsample
  
  # visualization
  plot(X, xaxt="n", yaxt="n", xlim=c(0,1), ylim=c(0,1), xlab="factor 1", 
    ylab="factor 2", col="cyan", main="BLHS")
  b <- seq(0, 1, by=1/6)
  abline(h=b, v=b, col="black", lty=2)
  axis(1, at=seq (0, 1, by=1/6), cex.axis=0.8, 
    labels=expression(0, 1/6, 2/6, 3/6, 4/6, 5/6, 1))
  axis(2, at=seq (0, 1, by=1/6), cex.axis=0.8, 
    labels=expression(0, 1/6, 2/6, 3/6, 4/6, 5/6, 1), las=1)
  points(Xsub, col="red", pch=19, cex=1.25)
  
  ## Comparing global lengthscale MLE based on BLHS and random subsampling
  ## Not run: 
##D     # famous borehole function
##D     borehole <- function(x){
##D       rw <- x[1] * (0.15 - 0.05) + 0.05
##D       r <-  x[2] * (50000 - 100) + 100
##D       Tu <- x[3] * (115600 - 63070) + 63070
##D       Tl <- x[5] * (116 - 63.1) + 63.1
##D       Hu <- x[4] * (1110 - 990) + 990
##D       Hl <- x[6] * (820 - 700) + 700
##D       L <-  x[7] * (1680 - 1120) + 1120
##D       Kw <- x[8] * (12045 - 9855) + 9855
##D       m1 <- 2 * pi * Tu * (Hu - Hl)
##D       m2 <- log(r / rw)
##D       m3 <- 1 + 2*L*Tu/(m2*rw^2*Kw) + Tu/Tl
##D       return(m1/m2/m3)
##D     }
##D     
##D     N <- 100000                   # number of observations
##D     xt <- randomLHS(N, 8)         # input space
##D     yt <- apply(xt, 1, borehole)  # response
##D     colnames(xt) <- c("rw", "r", "Tu", "Tl", "Hu", "Hl", "L", "Kw")
##D 
##D     ## prior on the GP lengthscale parameter
##D     da <- darg(list(mle=TRUE, max=100), xt)
##D 
##D     ## make space for two sets of boxplots
##D     par(mfrow=c(1,2))
##D     
##D     # BLHS calculating with visualization of the K MLE lengthscale estimates
##D     K <- 10  # number of Bootstrap samples; Sun, et al (2017) uses K <- 31
##D     sub_blhs <- blhs.loop(y=yt, X=xt, K=K, m=2, da=da, maxit=200, plot.it=TRUE)
##D   
##D     # a random subsampling analog for comparison
##D     sn <- sub_blhs$ly # extract a size that is consistent with the BLHS
##D     that.rand <- matrix(NA, ncol=8, nrow=K)
##D     for(i in 1:K){
##D       sub <- sample(1:nrow(xt), sn)
##D       gpsepi <- newGPsep(xt[sub,], yt[sub], d=da$start, g=1e-3, dK=TRUE)
##D       mle <- mleGPsep(gpsepi, tmin=da$min, tmax=10*da$max, ab=da$ab, maxit=200)
##D       deleteGPsep(gpsepi)
##D       that.rand[i,] <- mle$d
##D     }
##D 
##D     ## put random boxplots next to BLHS ones
##D     boxplot(that.rand, xlab="input", ylab="theta-hat", col=2, 
##D       main="random subsampling")
##D   
## End(Not run)



