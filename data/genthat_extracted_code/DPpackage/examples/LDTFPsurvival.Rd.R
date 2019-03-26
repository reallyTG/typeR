library(DPpackage)


### Name: LDTFPsurvival
### Title: Survival Regression using Linear Dependent Tailfree Processes
### Aliases: LDTFPsurvival LDTFPsurvival.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D    #############################################################
##D    # Time to Cosmetic Deterioration of Breast Cancer Patients
##D    #############################################################
##D 
##D      data(deterioration)
##D      attach(deterioration)
##D      y <- cbind(left,right)
##D       
##D    # Design matrix
##D 
##D      x <- cbind(rep(1,length(trt)),trt)
##D      xtf <- cbind(rep(1,length(trt)),trt)
##D      colnames(x) <- c("(Intercept)","trt")
##D      colnames(xtf) <- c("(Intercept)","trt")
##D       
##D    # Prediction
##D 
##D      xdenpred <- cbind(rep(1,2),c(0,1))
##D      xtfdenpred <- cbind(rep(1,2),c(0,1))
##D      xmedpred <- cbind(rep(1,2),c(0,1))
##D      xtfmedpred <- cbind(rep(1,2),c(0,1))
##D 
##D      prediction <- list(xdenpred=xdenpred,
##D                         xtfdenpred=xtfdenpred,
##D                         xmedpred=xmedpred,
##D                         xtfmedpred=xtfmedpred,
##D                         quans=c(0.03,0.50,0.97))
##D 
##D    # Prior information
##D 
##D      prior <- list(maxm=5,
##D                    a0=1,
##D                    b0=1,
##D                    mub=rep(0,2),
##D                    Sb=diag(1000,2),
##D                    tau1=2,002,
##D                    tau2=2.002)
##D 
##D    # Initial state
##D      state <- NULL
##D 
##D    # MCMC parameters
##D 
##D      mcmc <- list(nburn=5000,
##D                   nsave=5000,
##D                   nskip=4,
##D                   ndisplay=200)
##D 
##D    # Fitting the model
##D  
##D      fit1 <- LDTFPsurvival(y=y,
##D                            x=x,
##D                            xtf=xtf,
##D                            prediction=prediction,
##D                            prior=prior, 
##D                            mcmc=mcmc,     
##D                            state=state,
##D                            grid=seq(0.01,70,len=200),
##D                            status=TRUE,
##D                            compute.band=TRUE)
##D 
##D      fit1
##D      summary(fit1)
##D      plot(fit1)
##D 
##D    # Plotting survival functions estimates
##D  
##D      par(cex=1.7,mar=c(4.1, 4.1, 1, 1))
##D      x1 <- fit1$grid
##D      y1 <- fit1$survml[1,]
##D      x2 <- fit1$grid
##D      y2 <- fit1$survmu[1,]
##D      aa <- rbind(x2,y2)[, order(-x2, y2)]
##D      x2 <- aa[1,]
##D      y2 <- aa[2,]
##D      plot(fit1$grid,fit1$survmu[1,],type="l",
##D           xlab="months",ylab="survival",
##D           lty=1,lwd=2,ylim=c(0,1),col="lightgray")
##D      polygon(x=c(x1,x2),y=c(y1,y2),border=NA,col="lightgray")
##D      lines(fit1$grid,fit1$survmm[1,],lty=1,lwd=3)
##D 
##D      par(cex=1.7,mar=c(4.1, 4.1, 1, 1))
##D      x1 <- fit1$grid
##D      y1 <- fit1$survml[2,] 
##D      x2 <- fit1$grid
##D      y2 <- fit1$survmu[2,]
##D      aa <- rbind(x2,y2)[, order(-x2, y2)]
##D      x2 <- aa[1,]
##D      y2 <- aa[2,]
##D      plot(fit1$grid,fit1$survmu[2,],type="l",
##D           xlab="months",ylab="survival",
##D           lty=1,lwd=2,ylim=c(0,1),col="lightgray")
##D      polygon(x=c(x1,x2),y=c(y1,y2),border=NA,col="lightgray")
##D      lines(fit1$grid,fit1$survmm[2,],lty=1,lwd=3)
## End(Not run)



