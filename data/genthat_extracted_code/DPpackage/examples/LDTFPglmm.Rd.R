library(DPpackage)


### Name: LDTFPglmm
### Title: Generalized linear mixed model using a linear dependent tailfree
###   prior
### Aliases: LDTFPglmm LDTFPglmm.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ##############################################
##D     # A simulated data using "perfect"
##D     # simulation from a mixture of two 
##D     # normals and normal true models for 
##D     # the random effects.
##D     # A Poisson sampling distribution 
##D     # is considered.
##D     ##############################################
##D 
##D     # Functions needed to simulate random effects
##D     # and to evaluate true models
##D 
##D       findq <- function(true.cdf,target,low,
##D                        upp,epsilon=0.0000001)
##D       {
##D          plow <- true.cdf(low)
##D          pupp <- true.cdf(upp)
##D          pcenter <- true.cdf((upp+low)/2) 
##D          err <- abs(pcenter-target)
##D          i <- 0 
##D          while(err > epsilon)
##D          {
##D                i <- i + 1
##D                if(target< pcenter)
##D                {  
##D                   upp <- (upp+low)/2
##D                   pupp <- pcenter
##D                   pcenter <- true.cdf((upp+low)/2) 
##D                   err <- abs(pcenter-target)
##D                } 
##D                if(target>= pcenter)
##D                {  
##D                   low <- (upp+low)/2
##D                   plow <- pcenter
##D                   pcenter <- true.cdf((upp+low)/2) 
##D                   err <- abs(pcenter-target)
##D                } 
##D            }
##D            return((upp+low)/2)	
##D       }	
##D 
##D       true.dens1 <- function(x)
##D       {
##D            0.5*dnorm(x,2.,sqrt(0.005))+
##D            0.5*dnorm(x,2.85,sqrt(0.005))
##D       }
##D 
##D       true.dens2 <- function(x)
##D       {
##D            dnorm(x,2.1,sqrt(0.0324))
##D       }
##D 
##D       true.cdf1 <- function(x)
##D       {
##D            0.5*pnorm(x,2.,sqrt(0.005))+
##D            0.5*pnorm(x,2.85,sqrt(0.005))
##D       }
##D 
##D       true.cdf2 <- function(x)
##D       {
##D            pnorm(x,2.1,sqrt(0.0324))
##D       }
##D 
##D     # Simulation of random effects
##D 
##D       nsubject <- 200
##D       nsim <- nsubject/2 
##D       qq <- seq(1,nsim)/(nsim+1)
##D       b1 <- rep(0,nsim)
##D       for(i in 1:nsim)
##D       {
##D           aa <- findq(true.cdf1,qq[i],low=-6,upp=6)
##D           b1[i] <- aa 
##D       }	
##D 
##D       b2 <- rep(0,nsim)
##D       for(i in 1:nsim)
##D       {
##D          aa <- findq(true.cdf2,qq[i],low=-6,upp=6)
##D          b2[i] <- aa 
##D       }	
##D 
##D       trt <- c(rep(0,nsim),rep(1,nsim))
##D       b <- c(b1,b2)
##D 
##D       xtf <- cbind(rep(1,nsubject),trt)
##D 
##D     # Simulation of responses
##D 
##D       ni <- 5
##D       nrec <- nsubject*ni
##D       y <- NULL
##D       g <- NULL
##D       x <- NULL
##D 
##D       z <- rnorm(nrec)
##D 
##D       ll <- 0
##D       for(i in 1:nsubject)
##D       {     
##D           g <- c(g,rep(i,ni))
##D           for(j in 1:ni)
##D           {   
##D               ll <- ll +1
##D               etaij <- b[i] + 1.2*z[ll]
##D               ytmp <- rpois(1,exp(etaij))
##D               y <- c(y,ytmp)
##D               x <- rbind(x,c(1,trt[i],z[ll]))
##D           }
##D      }
##D      colnames(x) <- c("Intercept","trt","z")
##D 
##D    # Design matrix for prediction 
##D        
##D      xpred <- rbind(c(1,0,0),c(1,1,0))
##D      xtfpred <- rbind(c(1,0),c(1,1)) 
##D 
##D      prediction <- list(xpred=xpred,
##D                         xtfpred=xtfpred,
##D                         quans=c(0.03,0.50,0.97))
##D 
##D    # Prior information
##D      prior <- list(maxm=5,
##D                    alpha=0.5,
##D                    mub=rep(0,3),
##D                    Sb=diag(1000,3),
##D                    taub1=2.002,
##D                    taub2=2.002)
##D 
##D    # Initial state
##D      state <- NULL
##D 
##D 
##D    # MCMC parameters
##D      nburn <- 4000
##D      nsave <- 4000
##D      nskip <- 3
##D      ndisplay <- 500
##D      mcmc <- list(nburn=nburn,
##D                   nsave=nsave,
##D                   nskip=nskip,
##D                   ndisplay=ndisplay)
##D 
##D 
##D    # Fitting the model
##D      fit1 <- LDTFPglmm(y=y,x=x,g=g,family=poisson(log),
##D                        xtf=xtf,grid=seq(1.2,3.2,len=200),
##D                        prediction=prediction,
##D                        prior=prior, 
##D                        mcmc=mcmc,     
##D                        state=state,
##D                        status=TRUE,
##D                        compute.band=TRUE)
##D 
##D    # Plotting density estimates and true models
##D    # for the random intercepts
##D 
##D      par(cex=1.7,mar=c(4.1, 4.1, 1, 1))
##D      plot(fit1$grid,fit1$densu[1,],type="l",xlab="y",
##D           ylab="f(y|x)",lty=2,lwd=3,main="trt=0")
##D      lines(fit1$grid,fit1$densl[1,],lty=2,lwd=3)
##D      lines(fit1$grid,fit1$densm[1,],lty=1,lwd=3)
##D      tmp1 <- true.dens1(fit1$grid)
##D      lines(fit1$grid,tmp1,lty=1,lwd=3,col="red") 
##D 
##D      par(cex=1.7,mar=c(4.1, 4.1, 1, 1))
##D      plot(fit1$grid,fit1$densu[2,],type="l",xlab="y",
##D           ylab="f(y|x)",lty=2,lwd=3,main="trt=1")
##D      lines(fit1$grid,fit1$densl[2,],lty=2,lwd=3)
##D      lines(fit1$grid,fit1$densm[2,],lty=1,lwd=3)
##D      tmp1 <- true.dens2(fit1$grid)
##D      lines(fit1$grid,tmp1,lty=1,lwd=3,col="red") 
##D 
## End(Not run)



