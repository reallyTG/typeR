library(DPpackage)


### Name: DPrasch
### Title: Bayesian analysis for a semiparametric Rasch model
### Aliases: DPrasch DPrasch.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ####################################
##D     # A simulated Data Set
##D     ####################################
##D       nsubject <- 200
##D       nitem <- 40
##D       
##D       y <- matrix(0,nrow=nsubject,ncol=nitem)
##D       dimnames(y) <- list(paste("id",seq(1:nsubject)), 
##D                           paste("item",seq(1,nitem)))
##D 
##D       
##D       ind <- rbinom(nsubject,1,0.5)
##D       theta <- ind*rnorm(nsubject,1,0.25)+(1-ind)*rnorm(nsubject,3,0.25)
##D       beta <- c(0,seq(-1,3,length=nitem-1))
##D       true.cdf <- function(grid)
##D       {
##D          0.5*pnorm(grid,1,0.25)+0.5*pnorm(grid,3,0.25) 
##D       }  
##D       for(i in 1:nsubject)
##D       {
##D          for(j in 1:nitem)
##D          {
##D             eta<-theta[i]-beta[j]         
##D             mean<-exp(eta)/(1+exp(eta))
##D             y[i,j]<-rbinom(1,1,mean)
##D          }
##D       }
##D 
##D     # Prior information
##D 
##D       beta0 <- rep(0,nitem-1)
##D       Sbeta0 <- diag(1000,nitem-1)
##D 
##D       prior <- list(alpha=1,
##D                     tau1=6.02,
##D                     tau2=2.02,
##D                     mub=0,
##D                     Sb=100,
##D                     beta0=beta0,
##D                     Sbeta0=Sbeta0)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5000
##D       nsave <- 5000
##D       nskip <- 0
##D       ndisplay<- 1000
##D       mcmc <- list(nburn=nburn,
##D                    nsave=nsave,
##D                    nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fit the model
##D       fit1 <- DPrasch(y=y,prior=prior,mcmc=mcmc, 
##D                       state=state,status=TRUE,grid=seq(-1,5,0.01),
##D                       compute.band=TRUE)
##D 
##D     # CDF estimate and truth
##D       plot(fit1$grid,true.cdf(fit1$grid),type="l",lwd=2,col="red",
##D            xlab=expression(theta),ylab="CDF")
##D       lines(fit1$grid,fit1$cdf,lwd=2,col="blue")
##D       lines(fit1$grid,fit1$cdf.l,lwd=2,col="blue",lty=2)
##D       lines(fit1$grid,fit1$cdf.u,lwd=2,col="blue",lty=2)
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



