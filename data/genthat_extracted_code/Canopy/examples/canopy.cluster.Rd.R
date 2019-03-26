library(Canopy)


### Name: canopy.cluster
### Title: EM algorithm for multivariate clustering of SNAs
### Aliases: canopy.cluster
### Keywords: package

### ** Examples

    data(AML43)
    R = AML43$R
    X = AML43$X
    Mu = AML43$Mu
    Tau = AML43$Tau
    pG = canopy.cluster.Estep(Tau, Mu, R, X)



