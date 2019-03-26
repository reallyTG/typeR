library(denpro)


### Name: profkern
### Title: Calculates a level set tree of a kernel estimate
### Aliases: profkern
### Keywords: smooth

### ** Examples

set.seed(1)
dendat<-matrix(rnorm(20),10)      # 10*2 data-matrix
pk<-profkern(dendat,h=1,N=c(8,8),Q=4)
plotvolu(pk)

dendat<-sim.data(n=200,type="mulmod")
pk<-profkern(dendat,h=1,N=c(64,64),Q=30)
plotvolu(pk)




