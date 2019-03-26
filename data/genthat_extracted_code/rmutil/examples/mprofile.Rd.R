library(rmutil)


### Name: mprofile
### Title: Produce Marginal Time Profiles for Plotting
### Aliases: mprofile mprofile.default plot.mprofile
### Keywords: hplot

### ** Examples

## Not run: 
##D ## try after you get the repeated package
##D library(repeated)
##D times <- rep(1:20,2)
##D dose <- c(rep(2,20),rep(5,20))
##D mu <- function(p) exp(p[1]-p[3])*(dose/(exp(p[1])-exp(p[2]))*
##D 	(exp(-exp(p[2])*times)-exp(-exp(p[1])*times)))
##D shape <- function(p) exp(p[1]-p[2])*times*dose*exp(-exp(p[1])*times)
##D conc <- matrix(rgamma(40,1,scale=mu(log(c(1,0.3,0.2)))),ncol=20,byrow=TRUE)
##D conc[,2:20] <- conc[,2:20]+0.5*(conc[,1:19]-matrix(mu(log(c(1,0.3,0.2))),
##D 	ncol=20,byrow=TRUE)[,1:19])
##D conc <- ifelse(conc>0,conc,0.01)
##D z <- gar(conc, dist="gamma", times=1:20, mu=mu, shape=shape,
##D 	preg=log(c(1,0.4,0.1)), pdepend=0.5, pshape=log(c(1,0.2)))
##D # plot individual profiles and the average profile
##D plot(iprofile(z), nind=1:2, pch=c(1,20), lty=3:4)
##D plot(mprofile(z), nind=1:2, lty=1:2, add=TRUE)
## End(Not run)



