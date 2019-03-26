library(RSEIS)


### Name: plt.MTM0
### Title: Plot MTM structure
### Aliases: plt.MTM0
### Keywords: hplot

### ** Examples


data(CE1)
plot(CE1$x, CE1$y, type='l')

len <- length(CE1$y)
 len2 <- 2*next2(len)
 Mspec <- mtapspec(CE1$y,  CE1$dt, klen=len2, MTP=list(kind=1,nwin=5,
               npi=3,inorm=0)  )


f<-Mspec$freq
M <- 1
 f1 <- 0.01
f2 <- 100
 plxy <- ''
 flag <- f>=f1 & f <= f2;
    freqs <- list(f[flag])
 mydof <- NULL
      myFv <- NULL
 amp <- Mspec$spec[1:length(f)]

      amp <- list(amp[flag])


a <- list(y=CE1$y, dt=CE1$dt)
frange <- range(freqs, na.rm = TRUE)
 prange <- range(amp  , na.rm = TRUE)

###  plot(freqs[[1]], amp[[1]])


 plt.MTM0(frange, prange, plxy, M, freqs, amp, a,
        dof=mydof, Fv=myFv, COL=4)






