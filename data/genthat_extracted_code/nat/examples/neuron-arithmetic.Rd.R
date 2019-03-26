library(nat)


### Name: *.neuron
### Title: Arithmetic for neuron coordinates
### Aliases: *.neuron +.neuron -.neuron /.neuron

### ** Examples

n1<-Cell07PNs[[1]]*2
n2<-Cell07PNs[[1]]*c(2,2,2,1)
stopifnot(all.equal(n1,n2))
n3<-Cell07PNs[[1]]*c(2,2,4)



