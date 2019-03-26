library(dlm)


### Name: FF
### Title: Components of a dlm object
### Aliases: FF FF<- V V<- GG GG<- W W<- m0 m0<- C0 C0<- FF.dlm FF<-.dlm
###   V.dlm V<-.dlm GG.dlm GG<-.dlm W.dlm W<-.dlm m0.dlm m0<-.dlm C0.dlm
###   C0<-.dlm JFF JFF<- JV JV<- JGG JGG<- JW JW<- X X<- JFF.dlm JFF<-.dlm
###   JV.dlm JV<-.dlm JGG.dlm JGG<-.dlm JW.dlm JW<-.dlm X.dlm X<-.dlm
### Keywords: ts

### ** Examples

set.seed(222)
mod <- dlmRandom(5, 6)
all.equal( FF(mod), mod$FF )
all.equal( V(mod), mod$V )
all.equal( GG(mod), mod$GG )
all.equal( W(mod), mod$W )
all.equal( m0(mod), mod$m0 )
all.equal( C0(mod), mod$C0)
m0(mod)
m0(mod) <- rnorm(6)
C0(mod)
C0(mod) <- rwishart(10, 6)
### A time-varying model
mod <- dlmModReg(matrix(rnorm(10), 5, 2))
JFF(mod)
X(mod)



