library(cmenet)


### Name: predictcme
### Title: Predict using a fitted 'cmenet' object
### Aliases: predictcme

### ** Examples

  ## No test: 

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

    #---------------------------------------------------------------
    # Prediction:
    #---------------------------------------------------------------

    ## cmenet (parameters tuned via cross-validation)
    cv.cme <- cv.cmenet(xme, xcme, y, var.names=colnames(model.mtx))

    ## lasso
    library(glmnet)
    cv.las <- cv.glmnet(cbind(xme,xcme),y)
    fit.las <- glmnet(cbind(xme,xcme),y)

    ## sparsenet (load from CRAN archive)
    # library(sparsenet)
    # cv.sn <- cv.sparsenet(cbind(xme,xcme),y)
    # fit.sn <- sparsenet(cbind(xme,xcme),y)

    ## estimate MSPE
    set.seed(1000)
    ntst <- 50
    latmtx <- mvrnorm(ntst,p,mu=rep(0,p),Sigma=covmtx)
    memtx <- (latmtx>=0)-(latmtx<0)
    tst.mtx <- full.model.mtx(memtx)$model.mtx
    xbtst <- inter + rowSums(tst.mtx[,ind])
    ytst <- xbtst + rnorm(ntst,sd=1)

    pred.cme <- predictcme(fit.cme,newx=tst.mtx)
    pred.cme <- pred.cme[,which(cv.cme$lambda.sib==cv.cme$params[1]),
                which(cv.cme$lambda.cou==cv.cme$params[2])]
    pred.las <- predict(fit.las,newx=tst.mtx)[,which(cv.las$lambda==cv.las$lambda.min)]
    # pred.sn <- predict(fit.sn,newx=tst.mtx)
    # pred.sn <- pred.sn[[which(fit.sn$gamma==cv.sn$parms.min[1])]][,
    #             which(fit.sn$lambda==cv.sn$parms.min[2])]
    mean( (ytst-pred.cme)^2 ) # cmenet:    1.67
    mean( (ytst-pred.las)^2 ) # lasso:     1.85
    # mean( (ytst-pred.sn)^2 )  # sparsenet: 1.81


  
## End(No test)



