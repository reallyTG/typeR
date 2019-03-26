library(TAM)


### Name: IRT.linearCFA
### Title: Linear Approximation of a Confirmatory Factor Analysis
### Aliases: IRT.linearCFA summary.IRT.linearCFA
### Keywords: Confirmatory factor analysis

### ** Examples

## Not run: 
##D library(lavaan)
##D 
##D #############################################################################
##D # EXAMPLE 1: Two-dimensional confirmatory factor analysis data.Students
##D #############################################################################
##D 
##D data(data.Students, package="CDM")
##D # select variables
##D vars <- scan(nlines=1, what="character")
##D     sc1 sc2 sc3 sc4 mj1 mj2 mj3 mj4
##D dat <- data.Students[, vars]
##D 
##D # define Q-matrix
##D Q <- matrix( 0, nrow=8, ncol=2 )
##D Q[1:4,1] <- Q[5:8,2] <- 1
##D 
##D #*** Model 1: Two-dimensional 2PL model
##D mod1 <- TAM::tam.mml.2pl( dat, Q=Q, control=list( nodes=seq(-4,4,len=12) ) )
##D summary(mod1)
##D 
##D # linear approximation CFA
##D cfa1 <- TAM::IRT.linearCFA(mod1)
##D summary(cfa1)
##D 
##D # linear CFA in lavaan package
##D lavmodel <- "
##D     sc=~ sc1+sc2+sc3+sc4
##D     mj=~ mj1+mj2+mj3+mj4
##D     sc1 ~ 1
##D     sc ~~ mj
##D     "
##D mod1b <- lavaan::sem( lavmodel, data=dat, missing="fiml", std.lv=TRUE)
##D summary(mod1b, standardized=TRUE, fit.measures=TRUE )
##D 
##D #############################################################################
##D # EXAMPLE 2: Unidimensional confirmatory factor analysis data.Students
##D #############################################################################
##D 
##D data(data.Students, package="CDM")
##D # select variables
##D vars <- scan(nlines=1, what="character")
##D     sc1 sc2 sc3 sc4
##D dat <- data.Students[, vars]
##D 
##D #*** Model 1: 2PL model
##D mod1 <- TAM::tam.mml.2pl( dat )
##D summary(mod1)
##D 
##D # linear approximation CFA
##D cfa1 <- TAM::IRT.linearCFA(mod1)
##D summary(cfa1)
##D 
##D # linear CFA
##D lavmodel <- "
##D     sc=~ sc1+sc2+sc3+sc4
##D     "
##D mod1b <- lavaan::sem( lavmodel, data=dat, missing="fiml", std.lv=TRUE)
##D summary(mod1b, standardized=TRUE, fit.measures=TRUE )
## End(Not run)



