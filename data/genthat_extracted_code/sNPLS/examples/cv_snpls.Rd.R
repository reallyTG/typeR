library(sNPLS)


### Name: cv_snpls
### Title: Cross-validation for a sNPLS model
### Aliases: cv_snpls

### ** Examples

## Not run: 
##D X_npls<-array(rpois(7500, 10), dim=c(50, 50, 3))
##D 
##D Y_npls<-matrix(2+0.4*X_npls[,5,1]+0.7*X_npls[,10,1]-0.9*X_npls[,15,1]+
##D 0.6*X_npls[,20,1]- 0.5*X_npls[,25,1]+rnorm(50), ncol=1)
##D 
##D cv1<- cv_snpls(X_npls, Y_npls, ncomp=1:2, keepJ = 1:3, keepK = 1:2, parallel = FALSE)
## End(Not run)



