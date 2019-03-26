library(chords)


### Name: Estimate.b.k
### Title: RDS population size estimation
### Aliases: Estimate.b.k

### ** Examples

# Preliminaries
data(brazil)
rds.object2<- initializeRdsObject(brazil)
see <- function(x) plot(x$estimates$Nk.estimates, type='h')

# Maximum likelihood
rds.object <- Estimate.b.k(rds.object = rds.object2 )
see(rds.object)

# View estimates:
plot(rds.object$estimates$Nk.estimates, type='h')
# Population size estimate:
sum(rds.object$estimates$Nk.estimates)
plot(rds.object$estimates$log.bk.estimates, type='h')

## Recover theta assuming b.k=b_0*k^theta
getTheta(rds.object)

# How many degrees were imputed?:
table(rds.object$estimates$convergence)


# Observed degree estimation:
rds.object.4 <- Estimate.b.k(rds.object = rds.object, type='observed')
see(rds.object.4)

# Naive rescaling
rds.object.5 <- Estimate.b.k(rds.object = rds.object, type='rescaling')
see(rds.object.5)

# Parametric rates
rds.object.6 <- Estimate.b.k(rds.object = rds.object, 
                             type='parametric')
see(rds.object.6)
jack.control <- makeJackControl(3, 1e1)
rds.object.7 <- Estimate.b.k(rds.object = rds.object, 
                             type='leave-d-out', 
                             jack.control = jack.control)
see(rds.object.7)
rds.object.8 <- Estimate.b.k(rds.object = rds.object, 
                             type='integrated', 
                             jack.control = jack.control)
see(rds.object.8)
rds.object.9 <- Estimate.b.k(rds.object = rds.object, 
                             type='jeffreys')
see(rds.object.9)



## Not run: 
##D ## Simulated data example:
##D     dk <- c(2, 1e1) # unique degree classes
##D     true.dks <- rep(0,max(dk)); true.dks[dk] <- dk
##D     true.Nks <- rep(0,max(dk)); true.Nks[dk] <- 1e3
##D     beta <- 1 #5e-6
##D     theta <-  0.1
##D     true.log.bks <- rep(-Inf, max(dk))
##D     true.log.bks[dk] <- theta*log(beta*dk)
##D     sample.length <- 4e2
##D     nsims <- 1e2
##D     
##D     simlist <- list()
##D     for(i in 1:nsims){
##D       simlist[[i]] <- makeRdsSample(
##D         N.k =true.Nks , 
##D         b.k = exp(true.log.bks),
##D         sample.length = sample.length)
##D     }
##D     
##D     
##D     # Estimate betas and theta with chords:
##D     llvec <- rep(NA,nsims)
##D     bklist <- list()
##D     for(i in 1:nsims){
##D       # i <- 2
##D       simlist[[i]] <- Estimate.b.k(rds.object = simlist[[i]])
##D       # llvec[i] <- simlist[[i]]$estimates$likelihood
##D       bklist[[i]] <- simlist[[i]]$estimates$log.bk.estimates
##D     }
##D     b1vec <- bklist ##D 
##D     b2vec <- bklist ##D 
##D     
##D     hist(b1vec)
##D     abline(v=true.log.bks[2])
##D     hist(b2vec)
##D     abline(v=true.log.bks[10])
##D     
##D     beta0vec <- rep(-Inf,nsims)
##D     thetavec <- rep(-Inf,nsims)
##D     nvec <- rep(-Inf,nsims)
##D     converged <- rep(9999,nsims)
##D     
##D     for(i in 1:nsims){
##D       # i <- 2
##D       nvec[i] <- sum(simlist[[i]]$estimates$Nk.estimates)
##D       converged[i] <- sum(simlist[[i]]$estimates$convergence, na.rm=TRUE)
##D       # tfit <- getTheta(simlist[[i]])
##D       # beta0vec[i] <- tfit$log.beta_0
##D       # thetavec[i] <- tfit$theta
##D     }
##D     summary(beta0vec)
##D     summary(nvec)
##D     # summary(thetavec)
##D     # hist(thetavec)
##D     # abline(v=theta)
##D     hist(nvec)
##D     abline(v=sum(true.Nks), col='red')
##D     abline(v=median(nvec, na.rm = TRUE), lty=2)
##D     table(converged)
##D     
##D     # Try various re-estimatinons:
##D     rds.object2 <- simlist[[which(is.infinite(nvec))[1]]]
##D     
##D     rds.object <- Estimate.b.k(rds.object = rds.object2 )
##D     see(rds.object)
##D     rds.object$estimates$Nk.estimates
##D     
##D     rds.object.5 <- Estimate.b.k(rds.object = rds.object, type='rescaling')
##D     see(rds.object.5) # will not work. less than 2 converging estimates.
##D     rds.object.5$estimates$Nk.estimates
##D     
##D     rds.object.6 <- Estimate.b.k(rds.object = rds.object, type='parametric')
##D     see(rds.object.6) # will not work. less than 2 converging estimates.
##D     
##D     
##D     jack.control <- makeJackControl(3, 1e2)
##D     rds.object.7 <- Estimate.b.k(rds.object = rds.object, 
##D                              type='leave-d-out', 
##D                              jack.control = jack.control)
##D     see(rds.object.7)
##D     rds.object.7$estimates$Nk.estimates
##D     
##D     
##D     rds.object.8 <- Estimate.b.k(rds.object = rds.object, type='integrated')
##D     see(rds.object.8)
##D     rds.object.8$estimates$Nk.estimates
##D     
##D     
##D     rds.object.9 <- Estimate.b.k(rds.object = rds.object, type='jeffreys')
##D     see(rds.object.9)
##D     rds.object.9$estimates$Nk.estimates
## End(Not run)




