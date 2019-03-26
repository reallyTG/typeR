library(cmenet)


### Name: cmenet
### Title: Bi-level selection of conditional main effects (fixed
###   parameters)
### Aliases: cmenet

### ** Examples

    library(MASS)
    n <- 50 #number of observations
    p <- 50 #number of main effects

    ## Simulate model matrix for MEs and CMEs
    set.seed(1000)
    rho <- 0.5 #correlation
    ones <- matrix(1,p,p)
    covmtx <- rho*ones+(1-rho)*diag(p)
    latmtx <- mvrnorm(n,p,mu=rep(0,p),Sigma=covmtx) #equicorrelated cov. matrix
    memtx <- (latmtx>=0)-(latmtx<0) #simulate model matrix for MEs
    model.mtx <- full.model.mtx(memtx)$model.mtx #generate model matrix for MEs and CMEs

    ## Set true model and generate response
    num.act <- 2 # two siblings active
    num.grp <- 4 # ... within four active groups
    ind <- c()
    for (ii in 1:num.grp){
      eff <- sample(seq(2*(p-1)),num.act)
      ind <- c(ind, p + eff + (ii-1)*(2*(p-1)))
    }
    colnames(model.mtx)[ind] # active CMEs

    des.mtx <- model.mtx[,ind]
    inter <- 12 #intercept
    xbtrue <- inter + rowSums(des.mtx)
    y <- xbtrue + rnorm(n,sd=1) #response
    xme <- model.mtx[,1:p]
    xcme <- model.mtx[,(p+1):ncol(model.mtx)]

    # Run cmenet
    fit.cme <- cmenet(xme, xcme, y)



