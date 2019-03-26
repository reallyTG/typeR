library(spaMM)


### Name: stripHLfit
### Title: Reduce the size of fitted objects
### Aliases: stripHLfit
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D ## rather unconvincing example : quantitative effect is small.
##D 
##D # measure size of saved object:
##D saveSize <- function (object,...) {
##D     tf <- tempfile(fileext = ".RData")
##D     on.exit(unlink(tf))
##D     save(object, file = tf,...)
##D     file.size(tf)
##D   }
##D data("Loaloa")  
##D lfit <- fitme(cbind(npos,ntot-npos)~elev1+elev2+elev3+elev4+maxNDVI1+seNDVI
##D                    +Matern(1|longitude+latitude), method="HL(0,1)",
##D               data=Loaloa, family=binomial(), fixed=list(nu=0.5,rho=1,lambda=0.5))
##D saveSize(lfit)                 
##D pfit <- predict(lfit,newdata=Loaloa,variances=list(cov=TRUE)) # increases size!
##D saveSize(lfit)
##D lfit <- stripHLfit(lfit)
##D saveSize(lfit)
## End(Not run)



