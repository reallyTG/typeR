library(embryogrowth)


### Name: ChangeSSM
### Title: Generate set of parameters for different forms of thermal norm
###   of reaction
### Aliases: ChangeSSM

### ** Examples

## Not run: 
##D data(resultNest_6p_SSM6p)
##D x1 <- resultNest_6p_SSM6p$par
##D data(resultNest_4p_SSM4p)
##D x2 <- resultNest_4p_SSM4p$par
##D temperaturesC <- (200:350)/10
##D s <- ChangeSSM(temperatures=temperaturesC, parameters=x1, initial.parameters=x2)
##D sY <- plotR(resultNest_6p_SSM6p, ylim=c(0,3), col="black", curves = "ML")
##D plotR(resultNest_4p_SSM4p, col="red", scaleY=sY, new=FALSE)
##D plotR(s$par, col="green", scaleY=sY, new=FALSE, curves = "ML")
##D legend("topleft", legend=c("r function to mimic", "Initial new r function", 
##D "Fitted new r function"), lty=c(1, 1, 1), col=c("black", "red", "green"))
##D # Other example to fit anchored parameters
##D data(resultNest_4p_SSM4p)
##D x0 <- resultNest_4p_SSM4p$par
##D t <- hist(resultNest_4p_SSM4p, plot=FALSE)
##D x <- c(3.4, 3.6, 5.4, 5.6, 7.6, 7.5, 3.2)
##D names(x) <- seq(from=range(t$temperatures)[1], to=range(t$temperatures)[2], 
##D      length.out=7)
##D newx <- ChangeSSM(temperatures = (200:350)/10, parameters = x0, 
##D        initial.parameters = x, 
##D        control=list(maxit=5000))
##D  # Example on how to generate a set of SSM parameters from anchored parameters
##D  xanchor <- GenerateAnchor(nests=resultNest_4p_SSM4p)
##D  x <- resultNest_4p_SSM4p$par
##D  xanchor["294"] <- 0
##D  xanchor["308"] <- 2.3291035
##D  x <- ChangeSSM(parameters = xanchor,
##D                      initial.parameters = x, control=list(maxit=5000))
##D  sY <- plotR(resultNest_4p_SSM4p$par, ylim = c(0,3), curves="ML")
##D  plotR(xprime$par, col="red", scaleY=sY, new=FALSE, curves="ML") 
##D  legend("topleft", legend=c("Fitted parameters", "Constrainted parameters"), lty=1, 
##D         col=c("black", "red"))
##D  # Weibull model
##D  x <- ChangeSSM(temperatures = (200:350)/10,
##D                 parameters = resultNest_4p_SSM4p$par,
##D                 initial.parameters = structure(c(73, 300, 26), 
##D                                                .Names = c("k", "lambda", "scale")), 
##D                 control=list(maxit=1000))
##D  # normal asymmetric model
##D  x <- ChangeSSM(temperatures = (200:350)/10,
##D                parameters = resultNest_4p_SSM4p$par,
##D                initial.parameters = structure(c(3, 10, 8, 32), 
##D                .Names = c("Scale", "sdL", "sdH", "Peak")), 
##D                control=list(maxit=1000))
##D  # trigonometric model
##D  x <- ChangeSSM(temperatures = (200:350)/10,
##D                parameters = resultNest_4p_SSM4p$par,
##D                initial.parameters = structure(c(3, 20, 40, 32), 
##D                .Names = c("Max", "LengthB", "LengthE", "Peak")), 
##D                control=list(maxit=1000))
##D 
##D  # example with a mcmc object, CI being 2.SD
##D  # Note the symmetric CI
##D data(resultNest_mcmc_4p_SSM4p)
##D new_result <- ChangeSSM(resultmcmc = resultNest_mcmc_4p_SSM4p, result = resultNest_4p_SSM4p,
##D                         temperatures = seq(from = 20, to = 35, by = 0.1), 
##D                         outmcmc = "mean-sd", 
##D                         initial.parameters = NULL)
##D 
##D plotR(new_result, ylim=c(0, 3), curves="ML")
##D  # example with a mcmc object, CI being defined by 2.5%-97.5% quantiles
##D  # Note the asymmetric CI
##D data(resultNest_mcmc_4p_SSM4p)
##D new_result <- ChangeSSM(resultmcmc = resultNest_mcmc_4p_SSM4p, result = resultNest_4p_SSM4p,
##D                         temperatures = seq(from = 20, to = 35, by = 0.1), 
##D                         outmcmc = "quantiles", 
##D                         initial.parameters = NULL)
##D  
##D plotR(new_result, ylim=c(0, 3), curves="ML")
##D plotR(new_result, ylim=c(0, 3), curves="ML quantiles")
## End(Not run)



