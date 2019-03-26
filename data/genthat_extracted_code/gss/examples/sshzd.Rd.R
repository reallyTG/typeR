library(gss)


### Name: sshzd
### Title: Estimating Hazard Function Using Smoothing Splines
### Aliases: sshzd sshzd1
### Keywords: smooth models survival

### ** Examples

## Model with interaction
data(gastric)
gastric.fit <- sshzd(Surv(futime,status)~futime*trt,data=gastric)
## exp(-Lambda(600)), exp(-(Lambda(1200)-Lambda(600))), and exp(-Lambda(1200))
survexp.sshzd(gastric.fit,c(600,1200,1200),data.frame(trt=as.factor(1)),c(0,600,0))
## Clean up
## Not run: 
##D rm(gastric,gastric.fit)
##D dev.off()
## End(Not run)

## THE FOLLOWING EXAMPLE IS TIME-CONSUMING
## Proportional hazard model
## Not run: 
##D data(stan)
##D stan.fit <- sshzd(Surv(futime,status)~futime+age,data=stan)
##D ## Evaluate fitted hazard
##D hzdrate.sshzd(stan.fit,data.frame(futime=c(10,20),age=c(20,30)))
##D ## Plot lambda(t,age=20)
##D tt <- seq(0,60,leng=101)
##D hh <- hzdcurve.sshzd(stan.fit,tt,data.frame(age=20))
##D plot(tt,hh,type="l")
##D ## Clean up
##D rm(stan,stan.fit,tt,hh)
##D dev.off()
## End(Not run)



