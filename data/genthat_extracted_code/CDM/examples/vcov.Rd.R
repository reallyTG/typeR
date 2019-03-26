library(CDM)


### Name: vcov
### Title: Asymptotic Covariance Matrix, Standard Errors and Confidence
###   Intervals
### Aliases: vcov.din confint.din IRT.se IRT.se.din
### Keywords: methods vcov confint

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: DINA model sim.dina
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D dat <- sim.dina
##D q.matrix <- sim.qmatrix
##D 
##D #****** Model 1: DINA Model
##D mod1 <- CDM::din( dat, q.matrix=q.matrix, rule="DINA")
##D # look into parameter table of the model
##D mod1$partable
##D # covariance matrix
##D covmat1 <- vcov(mod1 )
##D # extract coefficients
##D coef(mod1)
##D # extract standard errors
##D sqrt( diag( covmat1))
##D # compute confidence intervals
##D confint( mod1, level=.90 )
##D # output table with standard errors
##D IRT.se( mod1, extended=TRUE )
##D 
##D #****** Model 2: Constrained DINA Model
##D 
##D # fix some slipping parameters
##D constraint.slip <- cbind( c(2,3,5), c(.15,.20,.25) )
##D # set some skill class probabilities to zero
##D zeroprob.skillclasses <- c(2,4)
##D # estimate model
##D mod2 <- CDM::din( dat, q.matrix=q.matrix, guess.equal=TRUE,
##D      constraint.slip=constraint.slip, zeroprob.skillclasses=zeroprob.skillclasses)
##D # parameter table
##D mod2$partable
##D # freely estimated coefficients
##D coef(mod2)
##D # covariance matrix (estimated parameters)
##D vmod2a <- vcov(mod2)
##D sqrt( diag( vmod2a))        # standard errors
##D colnames( vmod2a )
##D names( attr( vmod2a, "coef") )    # extract coefficients
##D 
##D # covariance matrix (more parameters, extended=TRUE)
##D vmod2b <- vcov(mod2, extended=TRUE)
##D sqrt( diag( vmod2b))
##D attr( vmod2b, "coef")
##D # attach standard errors to parameter table
##D partable2 <- mod2$partable
##D partable2 <- partable2[ ! duplicated( partable2$parnames ), ]
##D partable2 <- data.frame( partable2, "se"=sqrt( diag( vmod2b)) )
##D partable2
##D 
##D # confidence interval for parameter "skill1" which is not in the model
##D #   cannot be calculated!
##D confint(mod2, parm=c( "skill1", "all_guess" ) )
##D # confidence interval for only some parameters
##D confint(mod2, parm=paste0("prob_skill", 1:3 ) )
##D 
##D # compute only information matrix
##D infomod2 <- vcov(mod2, infomat=TRUE)
## End(Not run)



