library(ORMDR)


### Name: ormdr
### Title: ORMDR : Odds ratio based multifactor-dimensioinality reduction
###   method
### Aliases: ormdr
### Keywords: distribution

### ** Examples

data(sample.dat)
z<-mdr.c(sample.dat, colresp=21, cs=1, combi=2, cv.fold = 10)
ormdr(sample.dat,bestcombi=as.numeric(z$best.combi),cs=1,colresp=21,CI.Asy=TRUE,CI.Boot=TRUE,B=1000)




