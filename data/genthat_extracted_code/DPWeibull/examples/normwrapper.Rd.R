library(DPWeibull)


### Name: normwrapper
### Title: A wrapper for the DPdensity function using LIO prior
### Aliases: normwrapper

### ** Examples

## Not run: 
##D library(DPWeibull)
##D # Scalar data from gamma(2,1)
##D 
##D n <-  200
##D y <- rgamma(n,2,1)
##D # Specify percentiles
##D fit <- normwrapper(y=y,y50=1,y95=4)
##D 
##D plot(fit$dens~fit$grid1,xlim=c(0,8),type="l")
##D curve(dgamma(x,2),xlim=c(0,8),lty=2,add=TRUE)
##D rug(y)
##D 
##D ############################################################################
##D 
##D # Bivariate t / normal mixture
##D library(mvtnorm)
##D 
##D df1 <- Inf
##D mu1 <- c(2,0)
##D T1 <- 3*solve(matrix(c(1,1,1,4),nrow=2))
##D df2 <- 5
##D mu2 <- c(0,0)
##D T2 <- (df2-2)/df2*matrix(c(1,0,0,1),c(2,2))
##D 
##D n <- 400
##D ratio <- 0.5
##D n1 <- rbinom(1,n,ratio)
##D n2 <- n-n1
##D Y1 <- rmvt(n1,df=df1,sigma=solve(T1),delta=mu1)
##D Y2 <- rmvt(n2,df=df2,sigma=solve(T2),delta=mu2)
##D Y <- rbind(Y1,Y2)
##D 
##D # MCMC settings
##D nburn = 1000
##D nsave = 1000
##D nskip = 0
##D ndisplay = 1000
##D mcmc = list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D ngrid <- 1000
##D mesh1 <- 7/100;
##D mesh2 <- 6/100
##D grid <- cbind(seq(-3,4,mesh1),seq(-3,3,mesh2))
##D 
##D # Use sample percentiles
##D fit <- normwrapper(y=Y,mcmc=mcmc,ngrid=ngrid,grid=grid)
##D 
##D image(x=fit$grid1,y=fit$grid2,z=fit$dens,col=terrain.colors(12))
##D contour(x=fit$grid1,y=fit$grid2,z=fit$dens,add=TRUE)
##D 
##D y50 <- c(0,0)
##D y95 <- c(3,3)
##D 
##D # Specify percentiles
##D fit2 <- normwrapper(y=Y,y50=y50,y95=y95,mcmc=mcmc,ngrid=ngrid,grid=grid)
##D 
##D image(x=fit2$grid1,y=fit2$grid2,z=fit2$dens,col=terrain.colors(12))
##D contour(x=fit2$grid1,y=fit2$grid2,z=fit2$dens,add=TRUE)
##D 
##D ############################################################################
##D 
##D # Air quality data, a real data example
##D set.seed(13)
##D data("airquality")
##D Y <- cbind(airquality$Ozone,airquality$Solar.R)
##D Y <- Y[!is.na(rowSums(Y)),]
##D n <- nrow(Y)
##D p <- 2
##D 
##D # MCMC settings
##D nburn <- 1000
##D nsave <- 1000
##D nskip <- 0
##D ndisplay <- 1000
##D mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D ngrid <- 10000
##D grid <- NULL
##D 
##D # Use sample percentiles
##D fit <- normwrapper(y=Y,mcmc=mcmc,ngrid=ngrid,grid=grid)
##D 
##D # Scatter plot
##D plot(Y[,2]~Y[,1],cex = 0.5,xlab = "Ozone (parts per billion)",
##D      ylab = "Solar radiation (Langleys)")
##D 
##D # Contour plot of bivariate density
##D image(x=fit$grid1,y=fit$grid2,z=fit$dens,col=terrain.colors(12),
##D       xlab = "Ozone (parts per billion)",
##D       ylab = "Solar radiation (Langleys)",main = "Density estimate")
##D contour(x=fit$grid1,y=fit$grid2,z=fit$dens,add=TRUE)
##D 
##D # Marginal density plots
##D plot(fit$fun1~fit$grid1,type="l",xlab = "Ozone (parts per billion)",
##D      ylab = "Density",main = "Marginal density estimate")
##D plot(fit$fun2~fit$grid2,type="l",xlab = "Solar radiation (Langleys)",
##D      ylab = "Density",main = "Marginal density estimate")
## End(Not run)



