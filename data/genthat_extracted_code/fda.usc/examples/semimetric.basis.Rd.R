library(fda.usc)


### Name: semimetric.basis
### Title: Proximities between functional data
### Aliases: semimetric.basis
### Keywords: cluster

### ** Examples


data(phoneme)
DATA1<-phoneme$learn[c(30:50,210:230),]
DATA2<-phoneme$test[231:250,]
a1=semimetric.basis(DATA1,DATA2)
a2=semimetric.basis(DATA1,DATA2,type.basis1="fourier",nbasis1=11,
type.basis2="fourier",nbasis2=11)
fd1 <- fdata2fd(DATA1)
fd2 <- fdata2fd(DATA2)
a3=semimetric.basis(fd1,fd2)
a4=semimetric.basis(fd1,fd2,nderiv=1)





