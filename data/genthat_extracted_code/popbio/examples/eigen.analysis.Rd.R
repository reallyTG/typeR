library(popbio)


### Name: eigen.analysis
### Title: Eigenvalue and eigenvector analysis of a projection matrix
### Aliases: eigen.analysis
### Keywords: survey

### ** Examples


## Imprimitive matrix
A <- matrix(c(0,0,2,.3,0,0,0,.6,0), nrow=3,byrow=TRUE)
A
ev <- eigen(A)
ev$values
Mod(ev$values)
lmax <- which.max(Re(ev$values))
lmax
Re(ev$values)[lmax]
## damping ratio is NA
eigen.analysis(A)
## cycles every 3 years
stage.vector.plot(pop.projection(A, c(1,1,1), 10)$stage.vectors)


### Teasel
data(teasel)
a<-eigen.analysis(teasel)
a
barplot(a$stable.stage, col="green", ylim=c(0,1),
       ylab="Stable stage proportion", xlab="Stage class", main="Teasel")
box()

op<-par(mfrow=c(2,2))
image2(teasel, cex=.8, mar=c(0.5,3,4,1) )
title("Teasel projection matrix", line=3)

image2(a$elasticities, cex=.8, mar=c(0.5,3,4,1) )
title("Elasticity matrix", line=3)

## default is sensitivity for non-zero elements in matrix
image2(a$sensitivities, cex=.8, mar=c(0.5,3,4,1) )
title("Sensitivity matrix 1", line=3)

## use zero=FALSE to get sensitivities of all elements
image2(eigen.analysis(teasel, zero=FALSE)$sensitivities, cex=.8, mar=c(0.5,3,4,1) )
title("Sensitivity matrix 2", line=3)
par(op)






