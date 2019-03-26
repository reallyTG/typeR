library(Canopy)


### Name: canopy.cluster.Mstep
### Title: M-step of EM algorithm for multivariate clustering of SNAs
### Aliases: canopy.cluster.Mstep
### Keywords: package

### ** Examples

    data(AML43)
    R = AML43$R; X = AML43$X
    num_cluster = 4 # Range of number of clusters to run
    num_run = 6 # How many EM runs per clustering step
    Tau_Kplus1=0.05 # Proportion of noise component
    Mu.init=cbind(c(0.01,0.15,0.25,0.45),c(0.2,0.2,0.01,0.2)) # initial value
                                                              # of centroid
    canopy.cluster=canopy.cluster(R = R, X = X, num_cluster = num_cluster,
                                  num_run = num_run, Mu.init = Mu.init,
                                  Tau_Kplus1=Tau_Kplus1)



