library(MCMCpack)


### Name: MCMCdynamicIRT1d_b
### Title: Markov Chain Monte Carlo for Dynamic One Dimensional Item
###   Response Theory Model
### Aliases: MCMCdynamicIRT1d_b MCMCdynamicIRT1d MCMCdynamicIRT1d_b
### Keywords: models

### ** Examples


  ## Not run: 
##D 	data(Rehnquist)
##D 
##D 	## assign starting values
##D 	theta.start <- rep(0, 9)
##D 	theta.start[2] <- -3 ## Stevens
##D 	theta.start[7] <- 2  ## Thomas
##D 
##D 	out <- MCMCdynamicIRT1d(t(Rehnquist[,1:9]),
##D 	                        item.time.map=Rehnquist$time,
##D 	                        theta.start=theta.start,
##D 	                        mcmc=50000, burnin=20000, thin=5,
##D 	                        verbose=500, tau2.start=rep(0.1, 9),
##D 	                        e0=0, E0=1,
##D 	                        a0=0, A0=1,
##D 	                        b0=0, B0=1, c0=-1, d0=-1,
##D 	                        store.item=FALSE,
##D 	                        theta.constraints=list(Stevens="-", Thomas="+"))
##D 
##D 	summary(out)
##D   
## End(Not run)




