library(paleoMAS)


### Name: percenta
### Title: Computation of percentage matrix
### Aliases: percenta
### Keywords: manip arith

### ** Examples

pollen<-matrix(nrow=10,sample(c(1:100),50))
colnames(pollen)<-c("Sp1","Sp2","Sp3","Sp4","Sp5")
percenta(pollen,first=1,last=5)



