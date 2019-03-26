library(Canopy)


### Name: canopy.sample.cluster
### Title: MCMC sampling in tree space with pre-clustering of SNAs
### Aliases: canopy.sample.cluster
### Keywords: package

### ** Examples

    data(MDA231)
    R = MDA231$R; X = MDA231$X
    WM = MDA231$WM; Wm = MDA231$Wm
    epsilonM = MDA231$epsilonM; epsilonm = MDA231$epsilonm
    C = MDA231$C
    Y = MDA231$Y
    K = 3:6
    numchain = 20
    projectname = 'MDA231'
    # sampchain = canopy.sample.cluster(R = R, X = X, sna_cluster=c(1,2,3,4),
    #             WM = WM, Wm = Wm, epsilonM = epsilonM, 
    #             epsilonm = epsilonm, C = C, Y = Y, K = K, numchain = numchain, 
    #             max.simrun = 50000, min.simrun = 10000, writeskip = 200, 
    #             projectname = projectname, cell.line = TRUE, plot.likelihood = TRUE)



