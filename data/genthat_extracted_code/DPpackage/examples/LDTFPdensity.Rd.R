library(DPpackage)


### Name: LDTFPdensity
### Title: Density Regression using Linear Dependent Tailfree Processes
### Aliases: LDTFPdensity LDTFPdensity.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     ######################## 
##D     # IgG data
##D     ########################
##D       data(igg)
##D       z <- igg$age
##D       y <- log(igg$igg)
##D 
##D     # Design matrices
##D       ages1 <- z^2
##D       ages2 <- 1/ages1
##D 
##D       x <- cbind(rep(1,length(y)),ages1,ages2)
##D       xtf <- cbind(rep(1,length(y)),ages1,ages2)
##D        
##D       colnames(x) <- c("(Intercept)","age^2","age^{-2}")
##D       colnames(xtf) <- c("(Intercept)","age^2","age^{-2}")
##D 
##D     # Prediction
##D       xdpred <- c(11/12,25/12,38/12,52/12,65/12)
##D       agesp1 <- xdpred^2
##D       agesp2 <- 1/agesp1
##D       xdenpred <- cbind(rep(1,length(xdpred)),agesp1,agesp2)
##D       xtfdenpred <- xdenpred
##D 
##D       xmpred <- seq(0.5,6,len=50)
##D       agesp1 <- xmpred^2
##D       agesp2 <- 1/agesp1
##D       xmedpred <- cbind(rep(1,length(xmpred)),agesp1,agesp2)
##D       xtfmedpred <- xmedpred
##D  
##D       prediction <- list(xdenpred=xdenpred,
##D 			 xtfdenpred=xtfdenpred,
##D                          xmedpred=xmedpred,
##D                          xtfmedpred=xtfmedpred,
##D                          quans=c(0.03,0.50,0.97))
##D 
##D     # Prior information
##D       Sb <- diag(1000,3)
##D       mub <- rep(0,3)
##D  
##D       prior <- list(maxm=4,
##D                     a0=1,
##D                     b0=1,
##D                     mub=mub,
##D                     Sb=Sb,
##D                     tau1=2.02,
##D                     tau2=2.02)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       mcmc <- list(nburn=5000,
##D                    nsave=5000,
##D                    nskip=4,
##D                    ndisplay=200)
##D 
##D     # Fitting the model
##D  
##D       fit1 <- LDTFPdensity(y=y,
##D 			   x=x,
##D 			   xtf=xtf,
##D 			   prediction=prediction,
##D 			   prior=prior, 
##D 			   mcmc=mcmc,
##D 			   state=state, 
##D 			   status=TRUE,
##D 			   compute.band=TRUE)
##D 
##D       fit1
##D       summary(fit1)
##D       plot(fit1)
##D 
##D     # Plots predictions
##D     # (conditional densities and quantile functions)
##D 
##D       par(mfrow=c(3,2))      
##D  
##D       for(i in 1:5)
##D       {
##D          plot(fit1$grid,fit1$densm[i,],lwd=2,
##D               type="l",lty=1,col="black",xlab="log IgG",ylab="density",
##D               ylim=c(0,2))
##D          lines(fit1$grid,fit1$densl[i,],lwd=1,lty=2,col="black")    
##D          lines(fit1$grid,fit1$densu[i,],lwd=1,lty=2,col="black")    
##D       }
##D  
##D       plot(z,y,ylab="log IgG",xlab="Age (years)")
##D       lines(xmpred,fit1$qmm[,2],lwd=2)
##D       lines(xmpred,fit1$qml[,2],lwd=1,lty=2)
##D       lines(xmpred,fit1$qmu[,2],lwd=1,lty=2)
##D 
##D       lines(xmpred,fit1$qmm[,1],lwd=2)
##D       lines(xmpred,fit1$qml[,1],lwd=1,lty=2)
##D       lines(xmpred,fit1$qmu[,1],lwd=1,lty=2)
##D 
##D       lines(xmpred,fit1$qmm[,3],lwd=2)
##D       lines(xmpred,fit1$qml[,3],lwd=1,lty=2)
##D       lines(xmpred,fit1$qmu[,3],lwd=1,lty=2)
##D 
##D 
##D     #######################################
##D     # A simulated data using "perfect"
##D     # simulation (mixture of two normals 
##D     # and normal true models).
##D     #######################################
##D 
##D     # Functions needed to simulate data
##D     # and to evaluate true models
##D 
##D       findq <- function(true.cdf,target,low,
##D                         upp,epsilon=0.0000001)
##D       {
##D           plow <- true.cdf(low)
##D           pupp <- true.cdf(upp)
##D           pcenter <- true.cdf((upp+low)/2) 
##D           err <- abs(pcenter-target)
##D           i <- 0 
##D           while(err > epsilon)
##D           {
##D                 i <- i + 1
##D                 if(target< pcenter)
##D                 {  
##D                    upp <- (upp+low)/2
##D                    pupp <- pcenter
##D                    pcenter <- true.cdf((upp+low)/2) 
##D                    err <- abs(pcenter-target)
##D                 } 
##D                 if(target>= pcenter)
##D                 {  
##D                    low <- (upp+low)/2
##D                    plow <- pcenter
##D                    pcenter <- true.cdf((upp+low)/2) 
##D                    err <- abs(pcenter-target)
##D                 } 
##D             }
##D             return((upp+low)/2)	
##D       }	
##D 
##D       true.dens1 <- function(x)
##D       {
##D             0.5*dnorm(x,2.5,sqrt(0.005))+
##D             0.5*dnorm(x,2.85,sqrt(0.005))
##D       }
##D 
##D       true.dens2 <- function(x)
##D       {
##D             dnorm(x,2.1,sqrt(0.0324))
##D       }
##D 
##D       true.cdf1 <- function(x)
##D       {
##D             0.5*pnorm(x,2.50,sqrt(0.005))+
##D             0.5*pnorm(x,2.85,sqrt(0.005))
##D       }
##D 
##D       true.cdf2 <- function(x)
##D       {
##D             pnorm(x,2.1,sqrt(0.0324))
##D       }
##D 
##D     # Simulation
##D       nsim <- 500 
##D       qq <- seq(1,nsim)/(nsim+1)
##D 
##D       y1 <- rep(0,nsim)
##D       for(i in 1:nsim)
##D       {
##D           aa <- findq(true.cdf1,qq[i],low=-6,upp=6)
##D           y1[i] <- aa 
##D       }	
##D 
##D       y2 <- rep(0,nsim)
##D       for(i in 1:nsim)
##D       {
##D           aa <- findq(true.cdf2,qq[i],low=-6,upp=6)
##D           y2[i] <- aa 
##D       }	
##D 
##D       trt <- c(rep(0,nsim),rep(1,nsim))
##D       y <- c(y1,y2)
##D 
##D     # Design matrices
##D       W1 <- cbind(rep(1,2*nsim),trt)
##D       W2 <- cbind(rep(1,2*nsim),trt)
##D       colnames(W1) <- c("(Intercept)","trt")
##D       colnames(W2) <- c("(Intercept)","trt")
##D 
##D     # Design matrix for prediction 
##D       intp <- rep(1,2)
##D       trtp <- c(0,1)
##D       zpred <- cbind(intp,trtp) 
##D 
##D       prediction <- list(xdenpred=zpred,
##D                          xtfdenpred=zpred,
##D                          xmedpred=zpred,
##D                          xtfmedpred=zpred,
##D                          quans=c(0.03,0.50,0.97))
##D 
##D     # Prior information
##D       prior <- list(maxm=5,
##D                     a0=1,
##D                     b0=1,
##D                     mub=rep(0,2),
##D                     Sb=diag(1000,2),
##D                     tau1=2.002,
##D                     tau2=2.002)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn <- 5000
##D       nsave <- 5000
##D       nskip <- 4
##D       ndisplay <- 200
##D       mcmc <- list(nburn=nburn,
##D                    nsave=nsave,
##D                    nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fitting the model
##D       fit1 <- LDTFPdensity(y=y,
##D                            x=W1,
##D                            xtf=W2,
##D                            grid=seq(1.2,3.2,len=200),
##D                            prediction=prediction,
##D                            prior=prior, 
##D                            mcmc=mcmc,     
##D                            state=state,
##D                            status=TRUE,
##D                            compute.band=TRUE)
##D 
##D     # Plotting density estimates and true models
##D 
##D       par(cex=1.7,mar=c(4.1, 4.1, 1, 1))
##D       plot(fit1$grid,fit1$densu[1,],type="l",xlab="y",
##D            ylab="f(y|x)",lty=2,lwd=3,main="trt=0")
##D       lines(fit1$grid,fit1$densl[1,],lty=2,lwd=3)
##D       lines(fit1$grid,fit1$densm[1,],lty=1,lwd=3)
##D       tmp1 <- true.dens1(fit1$grid)
##D       lines(fit1$grid,tmp1,lty=1,lwd=3,col="red") 
##D 
##D       par(cex=1.7,mar=c(4.1, 4.1, 1, 1))
##D       plot(fit1$grid,fit1$densu[2,],type="l",xlab="y",
##D            ylab="f(y|x)",lty=2,lwd=3,main="trt=1")
##D       lines(fit1$grid,fit1$densl[2,],lty=2,lwd=3)
##D       lines(fit1$grid,fit1$densm[2,],lty=1,lwd=3)
##D       tmp1 <- true.dens2(fit1$grid)
##D       lines(fit1$grid,tmp1,lty=1,lwd=3,col="red") 
##D 
## End(Not run)



