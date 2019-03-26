library(TAM)


### Name: IRTLikelihood.cfa
### Title: Individual Likelihood for Confirmatory Factor Analysis
### Aliases: IRTLikelihood.cfa

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Two-dimensional CFA data.Students
##D #############################################################################
##D 
##D library(lavaan)
##D library(CDM)
##D 
##D data(data.Students, package="CDM")
##D dat <- data.Students
##D 
##D dat2 <- dat[, c(paste0("mj",1:4), paste0("sc",1:4)) ]
##D # lavaan model with DO operator
##D lavmodel <- "
##D DO(1,4,1)
##D    mj=~ mj%
##D    sc=~ sc%
##D DOEND
##D    mj ~~ sc
##D    mj ~~ 1*mj
##D    sc ~~ 1*sc
##D      "
##D lavmodel <- TAM::lavaanify.IRT( lavmodel, data=dat2 )$lavaan.syntax
##D cat(lavmodel)
##D 
##D mod4 <- lavaan::cfa( lavmodel, data=dat2, std.lv=TRUE )
##D summary(mod4, standardized=TRUE, rsquare=TRUE )
##D # extract item parameters
##D res4 <- TAM::cfa.extract.itempars( mod4 )
##D # create theta grid
##D theta0 <- seq( -6, 6, len=15)
##D theta <- expand.grid( theta0, theta0 )
##D L <- res4$L
##D nu <- res4$nu
##D psi <- res4$psi
##D data <- dat2
##D # evaluate likelihood using item parameters
##D like2 <- TAM::IRTLikelihood.cfa( data=dat2, theta=theta, L=L, nu=nu, psi=psi )
##D # The likelihood can also be obtained by direct evaluation
##D # of the fitted cfa object "mod4"
##D like4 <- TAM::IRTLikelihood.cfa( data=dat2, cfaobj=mod4 )
##D attr( like4, "theta")
##D # the theta grid is automatically created if theta is not
##D # supplied as an argument
## End(Not run)



