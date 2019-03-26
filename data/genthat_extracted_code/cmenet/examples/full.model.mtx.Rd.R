library(cmenet)


### Name: full.model.mtx
### Title: Generate full model matrix for MEs and CMEs
### Aliases: full.model.mtx

### ** Examples

    library(MASS)
    n <- 50 #number of observations
    p <- 50 #number of main effects

    #Simulate model matrix for MEs and CMEs
    rho <- 0.5 #correlation
    ones <- matrix(1,p,p)
    covmtx <- rho*ones+(1-rho)*diag(p)
    latmtx <- mvrnorm(n,p,mu=rep(0,p),Sigma=covmtx) #equicorrelated cov. matrix
    memtx <- (latmtx>=0)-(latmtx<0) #simulate model matrix for MEs
    model.mtx <- full.model.mtx(memtx)$model.mtx #generate model matrix for MEs and CMEs



