library(fda.usc)


### Name: fdata.bootstrap
### Title: Bootstrap samples of a functional statistic
### Aliases: fdata.bootstrap
### Keywords: datagen

### ** Examples


## Not run: 
##D data(tecator)
##D absorp<-tecator$absorp.fdata
##D # Time consuming
##D #Bootstrap for Trimmed Mean with depth mode
##D out.boot=fdata.bootstrap(absorp,statistic=func.trim.FM,nb=200,draw=TRUE)
##D names(out.boot)
##D #Bootstrap for Median with with depth mode
##D control=list("col"=c("grey","blue","cyan"),"lty"=c(2,1,1),"lwd"=c(1,3,1))
##D out.boot=fdata.bootstrap(absorp,statistic=func.med.mode,
##D draw=TRUE,draw.control=control)
## End(Not run)



