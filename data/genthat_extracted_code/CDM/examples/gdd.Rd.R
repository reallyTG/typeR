library(CDM)


### Name: gdd
### Title: Generalized Distance Discriminating Method
### Aliases: gdd
### Keywords: Generalized distance discriminating method (GDD)

### ** Examples

#############################################################################
# EXAMPLE 1: GDD for sim.dina
#############################################################################

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

data <- sim.dina
q.matrix <- sim.qmatrix

# estimate 1PL (use irtmodel="2PL" for 2PL estimation)
mod <- CDM::gdm( data, irtmodel="1PL", theta.k=seq(-6,6,len=21),
                    decrease.increments=TRUE, conv=.001, globconv=.001)
# extract item parameters in parametrization b + a*theta
b <- mod$b[,1]
a <- mod$a[,,1]
# extract person parameter estimate
theta <- mod$person$EAP.F1

# generalized distance discriminating method
res <- CDM::gdd( data, q.matrix, theta=theta, b=b, a=a )



