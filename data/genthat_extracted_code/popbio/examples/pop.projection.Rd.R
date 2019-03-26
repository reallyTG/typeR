library(popbio)


### Name: pop.projection
### Title: Calculate population growth rates by projection
### Aliases: pop.projection
### Keywords: survey

### ** Examples

## mean matrix from Freville et al 2004
stages<-c("seedling", "vegetative", "flowering")
A<-matrix(c(
    0,     0,  5.905,
0.368, 0.639,  0.025,
0.001, 0.152,  0.051
), nrow=3, byrow=TRUE, 
    dimnames=list(stages,stages) 
)

n<-c(5,5,5)
p<-pop.projection(A,n, 15)
p
damping.ratio(A)
stage.vector.plot(p$stage.vectors, col=2:4)


####

data(whale)
A<-whale
#n<-c(4,38,36,22)
n<-c(5,5,5,5)
p<-pop.projection(A,n, 15)
p
stage.vector.plot(p$stage.vectors, col=2:4, ylim=c(0, 0.6))
## convergence is slow with damping ratio close to 1
damping.ratio(A)
pop.projection(A,n, 100)$pop.changes



