library(DPpackage)


### Name: DPMraschpoisson
### Title: Bayesian analysis for a semiparametric Rasch Poisson model
### Aliases: DPMraschpoisson DPMraschpoisson.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ####################################
##D     # A simulated Data Set
##D     ####################################
##D       nsubject <- 250
##D       nitem <- 2
##D       
##D       y <- matrix(0,nrow=nsubject,ncol=nitem)
##D       dimnames(y)<-list(paste("id",seq(1:nsubject)), 
##D                                        paste("item",seq(1,nitem)))
##D 
##D       ind <- rbinom(nsubject,1,0.5)
##D       theta <- ind*rnorm(nsubject,-1,0.5)+(1-ind)*rnorm(nsubject,2,0.25)
##D       beta <- c(0,seq(-3,3,length=nitem-1))
##D 
##D       true.density <- function(grid)
##D       {
##D             0.5*dnorm(grid,-1,0.5)+0.5*dnorm(grid,2,0.25)  
##D       } 
##D 
##D       true.cdf <- function(grid)
##D       {
##D             0.5*pnorm(grid,-1,0.5)+0.5*pnorm(grid,2,0.25)  
##D       } 
##D 
##D       for(i in 1:nsubject)
##D       {
##D          for(j in 1:nitem)
##D          {
##D             eta <- theta[i]-beta[j]         
##D             rate <- exp(eta)
##D             y[i,j] <- rpois(1,rate)
##D          }
##D       }
##D 
##D     # Prior information
##D 
##D       beta0 <- rep(0,nitem-1)
##D       Sbeta0 <- diag(100,nitem-1)
##D 
##D       prior <- list(N=50,
##D                           a0=2,
##D                           b0=0.1,
##D                           taub1=6.01,
##D                           taub2=2.01,
##D                           taus1=6.01,
##D                           taus2=2.01,
##D                           tauk1=6.01,
##D                           m0=0,
##D                           s0=100,
##D                           beta0=beta0,
##D                           Sbeta0=Sbeta0)
##D 
##D     # Initial state
##D       state <- NULL      
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5000
##D       nsave <- 5000
##D       nskip <- 0
##D       ndisplay <- 100
##D       mcmc <- list(nburn=nburn,
##D                             nsave=nsave,
##D                             nskip=nskip,
##D                             ndisplay=ndisplay)
##D 
##D     # Fit the model
##D       fit1 <- DPMraschpoisson(y=y,prior=prior,mcmc=mcmc,
##D                               state=state,status=TRUE,grid=seq(-3,4,0.01))
##D    
##D       plot(fit1$grid,fit1$dens.m,type="l",lty=1,col="red",
##D            xlim=c(-3,4),ylim=c(0,0.8))
##D       lines(fit1$grid,true.density(fit1$grid),lty=2,col="blue")
##D 
##D       plot(fit1$grid,fit1$cdf.m,type="l",lty=1,col="red")
##D       lines(fit1$grid,true.cdf(fit1$grid),lty=2,col="blue")
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D     # Plot model parameters 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D       plot(fit1,ask=FALSE,nfigr=2,nfigc=2)	
##D 
##D     # Extract random effects
##D     
##D       DPrandom(fit1)
##D       plot(DPrandom(fit1))
##D       DPcaterpillar(DPrandom(fit1))
## End(Not run)



