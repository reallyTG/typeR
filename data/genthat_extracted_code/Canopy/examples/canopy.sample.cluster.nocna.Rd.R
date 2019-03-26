library(Canopy)


### Name: canopy.sample.cluster.nocna
### Title: MCMC sampling in tree space with pre-clustering of SNAs
### Aliases: canopy.sample.cluster.nocna
### Keywords: package

### ** Examples

    data(toy3)
    R = toy3$R; X = toy3$X
    sna_cluster = toy3$sna_cluster
    K = 3:5
    numchain = 10
    projectname = 'toy3'
    # sampchain = canopy.sample.cluster.nocna(R = R, X = X, 
    #             sna_cluster=sna_cluster, K = K, numchain = numchain, 
    #             max.simrun = 40000, min.simrun = 10000, writeskip = 200, 
    #             projectname = projectname,
    #             cell.line = TRUE, plot.likelihood = TRUE)



