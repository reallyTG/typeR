library(AICcmodavg)


### Name: covDiag
### Title: Compute Covariance Diagnostic for Lambda in _N_-mixture Models
### Aliases: covDiag covDiag.default covDiag.unmarkedFitPCount
###   covDiag.unmarkedFramePCount print.covDiag
### Keywords: models

### ** Examples

##modified example from ?pcount
## Not run: 
##D if(require(unmarked)){
##D ##Simulate data
##D set.seed(3)
##D nSites <- 100
##D nVisits <- 3
##D ##covariate
##D x <- rnorm(nSites)               
##D beta0 <- 0
##D beta1 <- 1
##D ##expected counts
##D lambda <- exp(beta0 + beta1*x)   
##D N <- rpois(nSites, lambda)      
##D y <- matrix(NA, nSites, nVisits)
##D p <- c(0.3, 0.6, 0.8)           
##D for(j in 1:nVisits) {
##D   y[,j] <- rbinom(nSites, N, p[j])
##D }
##D ## Organize data
##D visitMat <- matrix(as.character(1:nVisits),
##D                    nSites, nVisits, byrow=TRUE)
##D      
##D umf <- unmarkedFramePCount(y=y, siteCovs=data.frame(x=x),
##D                            obsCovs=list(visit=visitMat))
##D ## Fit model
##D fm1 <- pcount(~ visit ~ 1, umf, K=50)
##D covDiag(fm1)
##D 
##D ##sparser data
##D p <- c(0.01, 0.001, 0.01)           
##D for(j in 1:nVisits) {
##D   y[,j] <- rbinom(nSites, N, p[j])
##D }
##D ## Organize data
##D visitMat <- matrix(as.character(1:nVisits),
##D                    nSites, nVisits, byrow=TRUE)
##D      
##D umf <- unmarkedFramePCount(y=y, siteCovs=data.frame(x=x),
##D                            obsCovs=list(visit=visitMat))
##D ## Fit model
##D fm.sparse <- pcount(~ visit ~ 1, umf, K=50)
##D covDiag(fm.sparse)
##D }
## End(Not run)



