library(RSEIS)


### Name: mtapspec
### Title: MTM spectrum
### Aliases: mtapspec
### Keywords: misc

### ** Examples


data(CE1)
a <- list(y=CE1$y[CE1$x>5.443754 & CE1$x<5.615951], dt=CE1$dt)

    Mspec <-  mtapspec(a$y,a$dt, klen=4096,
             MTP=list(kind=2,nwin=5, npi=3,inorm=0)  )   




