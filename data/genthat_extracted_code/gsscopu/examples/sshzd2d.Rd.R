library(gsscopu)


### Name: sshzd2d
### Title: Estimating 2-D Hazard Function Using Smoothing Splines
### Aliases: sshzd2d sshzd2d1
### Keywords: smooth models survival

### ** Examples

## THE FOLLOWING EXAMPLE IS TIME-CONSUMING
## Not run: 
##D data(DiaRet)
##D ## Common proportional hazard model on the margins
##D fit <- sshzd2d(Surv(time1,status1)~time1+trt1*type,
##D                Surv(time2,status2)~time2+trt2*type,
##D                data=DiaRet,symmetry=TRUE)
##D ## Evaluate fitted survival and hazard functions
##D time <- cbind(c(50,70),c(70,70))
##D cova <- data.frame(trt1=as.factor(c(1,1)),trt2=as.factor(c(1,0)),
##D                    type=as.factor(c("juvenile","adult")))
##D survexp.sshzd2d(fit,time,cov=cova)
##D hzdrate.sshzd2d(fit,time,cov=cova)
##D ## Association between margins: Kendall's tau and Spearman's rho
##D summary(fit$copu)
##D ## Clean up
##D rm(DiaRet,fit,time,cova)
##D dev.off()
## End(Not run)



