library(cmenet)


### Name: maize1
### Title: Maize dataset 1
### Aliases: maize1

### ** Examples

  ## No test: 

    library(cmenet)
    library(hierNet)

    ## Load data
    data(maize1) #load in main effects (MEs) and response
    xme <- as.matrix(maize1[,1:(ncol(maize1)-1)])
    yy <- as.vector(maize1[,ncol(maize1)])
    nn <- nrow(xme)
    pp <- ncol(xme)
    model.mtx <- full.model.mtx(xme)$model.mtx #full model matrix
    xcme <- model.mtx[,(pp+1):ncol(model.mtx)] #model matrix for conditional main effects (CMEs)

    #---------------------------------------------------------------
    ## Selection:
    #---------------------------------------------------------------

    ## cmenet (new analysis: MEs and CMEs)
    set.seed(1000)
    cv.cme <- cv.cmenet(xme,xcme,yy,var.names=colnames(model.mtx)) #CV fit
    cme.dat <- data.frame(y=yy,x=model.mtx[,cv.cme$select.idx])
    cme.glm <- lm(y~.,data=cme.dat) #linear model on selected effects
    cv.cme$select.names #selected effects
    summary(cme.glm)$coefficients[,4] #p-values

    ## hierNet (traditional analysis: MEs and two-factor interactions)
    set.seed(1000)
    hnp <- hierNet.path(xme,yy) #hierNet path
    cv.hn <- hierNet.cv(hnp,xme,yy) #CV fit
    l.opt <- which(hnp$lamlist==cv.hn$lamhat)
    me.sel <- (hnp$bp-hnp$bn)[,l.opt]
    me.idx <- which(me.sel!=0) #selected main effects
    int.sel <- hnp$th[,,l.opt]
    int.idx <- which(int.sel!=0,arr.ind=T)
    int.idx <- t(apply(int.idx,1,function(xx){sort(xx)}))
    int.idx <- unique(int.idx) #selected interactions
    model.mtx.hier <- xme[,me.idx] #model matrix on selected effects
    for (ll in 1:nrow(int.idx)){
      model.mtx.hier <- cbind(model.mtx.hier, xme[,int.idx[ll,1]]*xme[,int.idx[ll,2]] )
    }
    int.nm <- sapply(1:nrow(int.idx),function(xx){
                paste0(colnames(xme)[int.idx[xx,1]],colnames(xme)[int.idx[xx,2]])
              })
    colnames(model.mtx.hier) <- c(colnames(xme)[me.idx],int.nm)
    hn.dat <- data.frame(y=yy,x=model.mtx.hier)
    hn.glm <- lm(y~.,data=hn.dat) #linear model on selected effects
    colnames(model.mtx.hier) #selected effects
    summary(hn.glm)$coefficients[,4] #p-values

    #---------------------------------------------------------------
    ## Analysis of selected effects:
    # (a) cmenet: more parsimonious gene-gene interaction model
    #     - hierNet: 66 variables
    #     - cmenet:  16 variables
    # (b) cmenet: greater insight on the conditional structure of
    #     selected MEs from traditional analysis (w/ lower p-values)
    #     - hierNet: g38 (p-val = 7.5x10^-1)
    #     - cmenet:  g11|g38+ (2.8x10-2), g12|g38- (4.6x10^-2), g14|g38+ (1.0x10^-2)
    #     Interpretation:
    #     - hierNet: gene 38 is active
    #     - cmenet: gene 38 activates genes 11 and 14, and inhibits gene 12
    # (c) cmenet: selected CMEs are more interpretable than selected
    #     interactions from traditional analysis (w/ lower p-values)
    #     - hierNet: g1*g39  (5.4x10^-2), g27*g39  (2.9x10^-1)
    #     - cmenet:  g1|g39- (3.9x10^-2), g27|g39- (5.4x10^-2)
    #     Interpretation:
    #     - hierNet: interactions exist b/w g1 & g39, and g27 & g39
    #     - cmenet:  gene 39 inhibits gene 1 and gene 27
    #---------------------------------------------------------------

    #---------------------------------------------------------------
    ## Prediction:
    #---------------------------------------------------------------

    ## cmenet (new analysis)
    set.seed(1)
    test.prop <- 0.2 # % for testing
    ntrials <- 25 # no. of replications
    mspe1 <- rep(NA,ntrials)
    for (i in 1:ntrials){

      # sample testing and training data
      foldid = sample(rep(seq(1/test.prop), length=length(yy)))
      yy.tr <- yy[which(foldid!=1)] #training
      xme.tr <- xme[which(foldid!=1),]
      xcme.tr <- xcme[which(foldid!=1),]
      yy.ts <- yy[which(foldid==1)] #testing
      xme.ts <- xme[which(foldid==1),]
      xcme.ts <- xcme[which(foldid==1),]

      # fit cmenet
      cv.cme <- cv.cmenet(xme.tr,xcme.tr,yy.tr,var.names=colnames(model.mtx))
      obj <- cv.cme$cme.fit
      pred <- predictcme(obj,newx=cbind(xme.ts,xcme.ts))
      mspe1[i] <- mean( (yy.ts-pred[,which(cv.cme$lambda.sib==cv.cme$params[1]),
                                   which(cv.cme$lambda.cou==cv.cme$params[2])])^2 )
    }
    mean(mspe1) #avg. mspe = 9.50

    ## hierNet (traditional analysis)
    set.seed(1)
    test.prop <- 0.2 # % for testing
    ntrials <- 25 # no. of replications
    mspe2 <- rep(NA,ntrials)
    for (i in 1:ntrials){

      # sample testing and training data
      foldid = sample(rep(seq(1/test.prop), length=length(yy)))
      yy.tr <- yy[which(foldid!=1)]
      xme.tr <- xme[which(foldid!=1),]
      xcme.tr <- xcme[which(foldid!=1),]
      yy.ts <- yy[which(foldid==1)]
      xme.ts <- xme[which(foldid==1),]
      xcme.ts <- xcme[which(foldid==1),]

      # fit hierNet
      hnfit <- hierNet.path(xme.tr,yy.tr)
      cv.hn <- hierNet.cv(hnfit,xme.tr,yy.tr)
      l.opt <- which(hnfit$lamlist==cv.hn$lamhat)
      mspe2[i] <- mean( (yy.ts-predict(hnfit,newx=xme.ts)[,l.opt])^2 )
    }

    mean(mspe2) #avg. mspe = 10.47

    #---------------------------------------------------------------
    ## Analysis of MSPE:
    # - cmenet gives lower prediction error, which suggests
    #   underlying gene-gene interactions may indeed be conditional
    #---------------------------------------------------------------

  
## End(No test)



