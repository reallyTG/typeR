library(rstpm2)


### Name: pstpm2
### Title: Penalised generalised survival model
### Aliases: pstpm2

### ** Examples

## Not run: 
##D data(brcancer)
##D ## standard Kaplan-Meier curves by hormon
##D plot(survfit(Surv(rectime/365,censrec==1)~1,data=brcancer,subset=hormon==1),
##D   xlab="Recurrence free survival time (years)",
##D   ylab="Survival")
##D lines(survfit(Surv(rectime/365,censrec==1)~1,data=brcancer,subset=hormon==0),col=2,
##D   conf.int=TRUE)
##D legend("topright", legend=c("Hormonal therapy","No hormonal therapy"),lty=1,col=1:2,bty="n")
##D 
##D ## now fit a penalised stpm2 model
##D fit <- pstpm2(Surv(rectime/365,censrec==1)~hormon,data=brcancer)
##D ## no S4 generic lines() method: instead, use plot(..., add=TRUE)
##D plot(fit,newdata=data.frame(hormon=1),type="surv",add=TRUE,ci=FALSE,line.col="blue",lwd=2,
##D   rug=FALSE)
##D plot(fit,newdata=data.frame(hormon=0),type="surv",add=TRUE,ci=FALSE,line.col="green",lwd=2,
##D   rug=FALSE)
##D 
##D ## plot showing proportional hazards
##D plot(fit,newdata=data.frame(hormon=1),type="hazard",line.col="blue",lwd=2,
##D   rug=FALSE,ylim=c(0,1e-3))
##D plot(fit,newdata=data.frame(hormon=0),type="hazard",add=TRUE,ci=FALSE,line.col="green",lwd=2,
##D   rug=FALSE)
##D 
##D ## time-varying hazard ratios
##D fit.tvc <- pstpm2(Surv(rectime,censrec==1)~1,
##D   data=brcancer,
##D   smooth.formula=~s(log(rectime))+s(log(rectime),by=hormon))
##D plot(fit.tvc,newdata=data.frame(hormon=1),type="hazard",line.col="blue",lwd=2,
##D   rug=FALSE)
##D plot(fit.tvc,newdata=data.frame(hormon=0),type="hazard",line.col="red",lwd=2,
##D   add=TRUE)
##D 
##D ## Smooth covariate effects
##D fit.smoothx <- pstpm2(Surv(rectime,censrec==1)~1,
##D   data=brcancer,
##D   smooth.formula=~s(log(rectime))+s(x1))
##D ages <- seq(21,80,length=301)
##D haz <- predict(fit.smoothx,newdata=data.frame(hormon=1,rectime=365,x1=ages),
##D                type="hazard",se.fit=TRUE)
##D matplot(ages,haz/haz[150,1],type="l",log="y",ylab="Hazard ratio")
##D 
##D ## compare with df=5 from stpm2
##D fit.stpm2 <- stpm2(Surv(rectime/365,censrec==1)~hormon,data=brcancer,df=7)
##D plot(fit,newdata=data.frame(hormon=1),type="hazard",line.col="blue",lwd=2,
##D   rug=FALSE,ylim=c(0,1e-3))
##D plot(fit.stpm2,newdata=data.frame(hormon=1),type="hazard",line.col="orange",lwd=2,
##D   rug=FALSE,add=TRUE,ci=FALSE)
##D 
##D ## time-varying coefficient
##D ##summary(fit.tvc <- pstpm2(Surv(rectime,censrec==1)~hormon,data=brcancer,
##D ##                     tvc=list(hormon=3)))
##D ##anova(fit,fit.tvc) # compare with and without tvc (unclear whether this is valid)
##D 
##D ## some more plots
##D ## plot(fit.tvc,newdata=data.frame(hormon=0),type="hr",var="hormon")
##D                                         # no lines method: use add=TRUE
##D ## plot(fit.tvc,newdata=data.frame(hormon=1),type="hr",var="hormon",
##D ##     add=TRUE,ci=FALSE,line.col=2)
##D 
##D ## plot(fit.tvc,newdata=data.frame(hormon=0),type="sdiff",var="hormon")
##D 
##D ## plot(fit.tvc,newdata=data.frame(hormon=0),type="hdiff",var="hormon")
##D 
##D ## plot(fit.tvc,newdata=data.frame(hormon=0),type="hazard")
##D ## plot(fit.tvc,newdata=data.frame(hormon=1),type="hazard",line.col=2,ci=FALSE,add=TRUE)
##D 
## End(Not run)



