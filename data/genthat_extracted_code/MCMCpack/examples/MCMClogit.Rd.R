library(MCMCpack)


### Name: MCMClogit
### Title: Markov Chain Monte Carlo for Logistic Regression
### Aliases: MCMClogit
### Keywords: models

### ** Examples


   ## Not run: 
##D    ## default improper uniform prior
##D    data(birthwt)
##D    posterior <- MCMClogit(low~age+as.factor(race)+smoke, data=birthwt)
##D    plot(posterior)
##D    summary(posterior)
##D 
##D 
##D    ## multivariate normal prior
##D    data(birthwt)
##D    posterior <- MCMClogit(low~age+as.factor(race)+smoke, b0=0, B0=.001,
##D                           data=birthwt)
##D    plot(posterior)
##D    summary(posterior)
##D 
##D 
##D    ## user-defined independent Cauchy prior
##D    logpriorfun <- function(beta){
##D      sum(dcauchy(beta, log=TRUE))
##D    }
##D 
##D    posterior <- MCMClogit(low~age+as.factor(race)+smoke,
##D                           data=birthwt, user.prior.density=logpriorfun,
##D                           logfun=TRUE)
##D    plot(posterior)
##D    summary(posterior)
##D 
##D 
##D    ## user-defined independent Cauchy prior with additional args
##D    logpriorfun <- function(beta, location, scale){
##D      sum(dcauchy(beta, location, scale, log=TRUE))
##D    }
##D 
##D    posterior <- MCMClogit(low~age+as.factor(race)+smoke,
##D                           data=birthwt, user.prior.density=logpriorfun,
##D                           logfun=TRUE, location=0, scale=10)
##D    plot(posterior)
##D    summary(posterior)
##D 
##D 
##D    
## End(Not run)




