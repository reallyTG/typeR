library(DPpackage)


### Name: DPMdencens
### Title: Bayesian density estimation for interval-censored data using a
###   DPM of normals
### Aliases: DPMdencens DPMdencens.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ####################################
##D     # Bivariate example:
##D     # Censored data is artificially
##D     # created 
##D     ####################################
##D 
##D       data(airquality)      
##D       attach(airquality)
##D 
##D       ozone <- Ozone**(1/3)
##D       radiation <- Solar.R
##D       y <- na.omit(cbind(radiation,ozone))
##D 
##D     # create censored-data 
##D       xxlim <- seq(0,300,50)
##D       yylim <- seq(1.5,5.5,1)
##D 
##D       left <- matrix(0,nrow=nrow(y),ncol=2)
##D       right <- matrix(0,nrow=nrow(y),ncol=2)
##D 
##D       for(i in 1:nrow(y))
##D       {
##D           left[i,1] <- NA
##D           right[i,1] <- NA
##D           if(y[i,1] < xxlim[1]) right[i,1] <- xxlim[1] 
##D           for(j in 1:length(xxlim))
##D           { 
##D               if(y[i,1] >= xxlim[j]) left[i,1] <- xxlim[j]	 
##D               if(y[i,1] >= xxlim[j]) right[i,1] <- xxlim[j+1]	 
##D           }	 
##D           left[i,2] <- NA
##D           right[i,2] <- NA
##D           if(y[i,2] < yylim[1]) right[i,2] <- yylim[1] 
##D 
##D           for(j in 1:length(yylim))
##D           { 
##D               if(y[i,2] >= yylim[j]) left[i,2] <- yylim[j]	 
##D               if(y[i,2] >= yylim[j]) right[i,2] <- yylim[j+1]	 
##D           }	 
##D       }
##D 
##D     # Prior information
##D       s2 <- matrix(c(10000,0,0,1),ncol=2)
##D       m2 <- c(180,3)
##D       psiinv2 <- diag(c(1/10000,1),2)
##D 
##D       prior <- list(alpha=1,nu1=4,nu2=4,s2=s2,
##D                     m2=m2,psiinv2=psiinv2,tau1=0.01,tau2=0.01)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn <- 5000
##D       nsave <- 5000
##D       nskip <- 3
##D       ndisplay <- 1000
##D       mcmc <- list(nburn=nburn, 
##D                    nsave=nsave,
##D                    nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fitting the model
##D       fit1 <- DPMdencens(left=left,right=right,ngrid=100,
##D                          prior=prior,mcmc=mcmc,
##D                          state=state,status=TRUE)
##D       fit1
##D       summary(fit1)
##D 
##D     # Plot the estimated density
##D       plot(fit1)
##D 
##D     # Extracting the univariate density estimates
##D       cbind(fit1$grid[,1],fit1$funi[[1]])
##D       cbind(fit1$grid[,2],fit1$funi[[2]])
##D        
##D     # Extracting the bivariate density estimates
##D       fit1$grid[,1]
##D       fit1$grid[,2]
##D       fit1$fbiv[[1]]
##D 
##D     # Plot of the estimated density along with the 
##D     # true data points and censoring limits
##D       contour(fit1$grid[,1],fit1$grid[,2],fit1$fbiv[[1]])
##D       points(y)
##D       abline(v=xxlim)
##D       abline(h=yylim)
## End(Not run)



