library(DPpackage)


### Name: LDDProc
### Title: Linear dependent DP model for conditional ROC curve estimation.
### Aliases: LDDProc LDDProc.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     ##############################################################
##D     # Simulated data example.
##D     # - Data generated using "perfect" simulation.
##D     # - one binary predictor.
##D     # - 250 observations in each 
##D     #   combination of predictor and 
##D     #   status.
##D     ##############################################################
##D 
##D     # Functions required for simulation
##D 
##D       findq <- function(true.cdf,target,low,upp,
##D                         epsilon=0.0000001)
##D       {
##D            plow <- true.cdf(low)
##D            pupp <- true.cdf(upp)
##D            pcenter <- true.cdf((upp+low)/2) 
##D            err <- abs(pcenter-target)
##D            i <- 0 
##D            while(err > epsilon)
##D            {
##D                  i <- i + 1
##D                  if(target< pcenter)
##D                  {  
##D                     upp <- (upp+low)/2
##D                     pupp <- pcenter
##D                     pcenter <- true.cdf((upp+low)/2) 
##D                     err <- abs(pcenter-target)
##D                  }  
##D                  if(target>= pcenter)
##D                  {   
##D                     low <- (upp+low)/2
##D                     plow <- pcenter
##D                     pcenter <- true.cdf((upp+low)/2) 
##D                     err <- abs(pcenter-target)
##D                  } 
##D            }
##D            return((upp+low)/2)	
##D       }
##D 
##D 
##D       true.cdf.nond1 <- function(x)
##D       {
##D          pnorm(x,2.1,sqrt(0.0324))
##D       }
##D 
##D       true.cdf.nond2 <- function(x)
##D       {
##D 	 0.5*pnorm(x,1.85,sqrt(0.005))+
##D          0.5*pnorm(x,2.25,sqrt(0.005))
##D       }
##D 
##D       true.cdf.d1 <- function(x)
##D       {
##D 	 0.5*pnorm(x,1.95,sqrt(0.005))+
##D          0.5*pnorm(x,2.35,sqrt(0.005))
##D       }
##D 
##D       true.cdf.d2 <- function(x)
##D       {
##D           pnorm(x,2.5,sqrt(0.0324))
##D       }
##D 	
##D     # Simulating the data
##D 
##D       nsim <- 250 
##D       qq <- seq(1,nsim)/(nsim+1)
##D 
##D       y.nond1 <- rep(0,nsim)
##D       for(i in 1:nsim)
##D       {
##D           aa <- findq(true.cdf.nond1,qq[i],
##D                       low=-6,upp=6,epsilon=0.0000001)
##D           y.nond1[i] <- aa 
##D       }	
##D 
##D       y.nond2 <- rep(0,nsim)
##D       for(i in 1:nsim)
##D       {
##D           aa <- findq(true.cdf.nond2,qq[i],
##D                       low=-6,upp=6,epsilon=0.0000001)
##D           y.nond2[i] <- aa 
##D       }	
##D       y.nond <- c(y.nond1,y.nond2)
##D       trt.nond <- c(rep(0,nsim),rep(1,nsim))
##D 
##D       y.d1 <- rep(0,nsim)
##D       for(i in 1:nsim)
##D       {
##D           aa <- findq(true.cdf.d1,qq[i],
##D                       low=-6,upp=6,epsilon=0.0000001)
##D           y.d1[i] <- aa 
##D       }	
##D 
##D       y.d2 <- rep(0,nsim)
##D       for(i in 1:nsim)
##D       {
##D           aa <- findq(true.cdf.d2,qq[i],
##D                       low=-6,upp=6,epsilon=0.0000001)
##D           y.d2[i] <- aa 
##D       }	
##D 
##D       y.d <- c(y.d1,y.d2)
##D       trt.d <- c(rep(0,nsim),rep(1,nsim))
##D 
##D     # Design matrices
##D 
##D       z.d <- cbind(rep(1,2*nsim),trt.d)
##D       colnames(z.d) <- c("(Intercept)","trt")
##D       z.nond <- cbind(rep(1,2*nsim),trt.nond)
##D       colnames(z.nond) <- c("(Intercept)","trt")
##D 
##D     # design matrix for posterior predictive inference 
##D 
##D       zpred <- rbind(c(1,0),c(1,1))  
##D 
##D     # Prior information
##D       prior <- list(a0=10,
##D                     b0=1,
##D                     nu=4,
##D                     m0=rep(0,2),
##D                     S0=diag(100,2),
##D                     psiinv=diag(1,2),
##D                     tau1=6.01,
##D                     taus1=6.01,
##D                     taus2=2.01)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5000
##D       nsave <- 5000
##D       nskip <- 4
##D       ndisplay <- 500
##D       mcmc <- list(nburn=nburn,
##D                    nsave=nsave,
##D                    nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fitting the model
##D 
##D       fit1 <- LDDProc(y.d=y.d,z.d=z.d,
##D                       y.nond=y.nond,z.nond=z.nond,
##D                       zpred.d=zpred,
##D                       prior.d=prior,
##D                       prior.nond=prior,
##D                       mcmc=mcmc,
##D                       state=state, 
##D                       status=TRUE,
##D                       compute.band=TRUE)
##D 
##D       fit1
##D       summary(fit1)
##D       plot(fit1)
##D 
##D 
##D      # Ploting the conditional
##D      # ROC curve for x=c(1,0),
##D      # along with the true curve
##D 
##D        par(cex=1.7,mar=c(4.1, 4.1, 1, 1))
##D 
##D        plot(fit1$rocgrid,fit1$rocp.h[1,],type="l",
##D             lty=2,lwd=2,ylim=c(0,1),xlim=c(0,1),
##D             xlab="False positive rate",
##D             ylab="True positive rate")
##D        lines(fit1$rocgrid,fit1$rocp.l[1,],lty=2,lwd=2)
##D        lines(fit1$rocgrid,fit1$rocp.m[1,],lty=1,lwd=2)
##D 
##D        nn <- length(fit1$rocgrid)
##D        tt <- rep(0,nn)
##D        for(i in 1:nn)
##D        {
##D 	   tt[i] <- findq(true.cdf.nond1,
##D                           1-fit1$rocgrid[i],
##D                           low=-6,upp=6,
##D                           epsilon=0.0000001)
##D        }	
##D        true.roc1 <- 1.0 - true.cdf.d1(tt) 
##D        lines(fit1$rocgrid,true.roc1,
##D              lty=1,lwd=3,col="red")
##D 
##D      # Ploting the conditional
##D      # ROC curve for x=c(1,1),
##D      # along with the true curve
##D 
##D        par(cex=1.7,mar=c(4.1, 4.1, 1, 1))
##D 
##D        plot(fit1$rocgrid,fit1$rocp.h[2,],type="l",
##D             lty=2,lwd=2,ylim=c(0,1),xlim=c(0,1),
##D             xlab="False positive rate", 
##D             ylab="True positive rate")
##D        lines(fit1$rocgrid,fit1$rocp.l[2,],lty=2,lwd=2)
##D        lines(fit1$rocgrid,fit1$rocp.m[2,],lty=1,lwd=2)
##D 
##D        nn <- length(fit1$rocgrid)
##D        tt <- rep(0,nn)
##D        for(i in 1:nn)
##D        {
##D            tt[i] <- findq(true.cdf.nond2,
##D                           1-fit1$rocgrid[i],
##D                           low=-6,upp=6,
##D                           epsilon=0.0000001)
##D        }	
##D        true.roc2 <- 1.0 - true.cdf.d2(tt) 
##D        lines(fit1$rocgrid,true.roc2,lty=1,lwd=3,col="red")
##D 
## End(Not run)



