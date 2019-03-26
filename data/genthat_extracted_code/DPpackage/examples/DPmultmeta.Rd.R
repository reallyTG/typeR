library(DPpackage)


### Name: DPmultmeta
### Title: Bayesian analysis for a semiparametric random effects
###   multivariate meta-analysis model using a MDP
### Aliases: DPmultmeta DPmultmeta.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ######################################################################   
##D     # Simulated Data: 
##D     #         mu_i ~ 0.5 N(mub1,Sigmab1) + 0.5 N(mub2,Sigmab2)
##D     #         y_i ~ N(mu_i,Sigma_i) 
##D     #         Sigma_1=...=Sigma_n=Sigma assumed to be known 
##D     ######################################################################
##D       nvar <- 2
##D       nrec <- 100
##D       Sigma <- matrix(c(0.25,0.15,0.15,0.25),nrow=nvar,ncol=nvar) 
##D       mub1 <- rep(-1.5,nvar)  
##D       mub2 <- rep( 0.5,nvar)  
##D       Sigmab1 <- matrix(c(0.25,-0.175,-0.175,0.25),nrow=nvar,ncol=nvar)
##D       Sigmab2 <- matrix(c(0.25, 0.0875, 0.0875,0.25),nrow=nvar,ncol=nvar)
##D       
##D       ind <- rbinom(nrec,1,0.5)
##D       z1 <- mub1+matrix(rnorm(nvar*nrec),nrow=nrec,ncol=nvar)##D 
##D       z2 <- mub2+matrix(rnorm(nvar*nrec),nrow=nrec,ncol=nvar)##D 
##D       mu <- ind*z1+(1-ind)*z2
##D       
##D       y <- NULL
##D       for(i in 1:nrec)
##D       {
##D           z <- mu[i,]+matrix(rnorm(nvar),nrow=1,ncol=nvar)##D 
##D           y <- rbind(y,z)
##D 
##D       }
##D       colnames(y) <- c("y1","y2")  
##D  
##D     ######################################################################   
##D     # Asymptotic variance
##D     ######################################################################   
##D       z <- NULL
##D       for(i in 1:nvar)
##D       {
##D           for(j in i:nvar)
##D           {
##D                 z <- c(z,Sigma[i,j])         
##D           }
##D       }
##D       asymvar <- matrix(z,nrow=nrec,ncol=nvar*(nvar+1)/2,byrow=TRUE)
##D 
##D 
##D     # Prior information
##D 
##D       s2 <-diag(100,nvar)
##D       m2 <-rep(0,nvar)
##D       nu <- 4
##D       psiinv <- diag(1,nvar)
##D      
##D       prior<-list(a0=1,
##D                   b0=1/5,
##D                   nu=nu,
##D                   m2=m2,
##D                   s2=s2,
##D                   psiinv=psiinv)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 500
##D       nsave <- 1000
##D       nskip <- 0
##D       ndisplay <- 100
##D       mcmc <- list(nburn=nburn,
##D                    nsave=nsave,
##D                    nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fitting the model
##D       fit1 <- DPmultmeta(y=y,asymvar=asymvar,prior=prior,
##D                          mcmc=mcmc,state=state,status=TRUE)
##D 
## End(Not run)



