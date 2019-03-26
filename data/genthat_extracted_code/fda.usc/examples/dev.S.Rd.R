library(fda.usc)


### Name: dev.S
### Title: The deviance score .
### Aliases: dev.S
### Keywords: utilities

### ** Examples


data(phoneme)
mlearn<-phoneme$learn
np<-ncol(mlearn)
tt<-mlearn[["argvals"]]
S1 <- S.NW(tt,2.5)
gcv1 <- dev.S(mlearn$data[1,],obs=(sample(150)), 
S1,off=rep(1,150),offdf=3)
gcv2 <- dev.S(mlearn$data[1,],obs=sort(sample(150)), 
S1,off=rep(1,150),offdf=3)
 


