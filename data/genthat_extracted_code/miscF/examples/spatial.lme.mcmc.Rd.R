library(miscF)


### Name: spatail.lme.mcmc
### Title: Spatial Modeling by a Bayesian Hierarchical Linear Mixed-effects
###   Model
### Aliases: spatial.lme.mcmc
### Keywords: spatial

### ** Examples

## Not run: 
##D     #simulate the data
##D     ns=100; nr=2; nlr <- c(20, 20)
##D     mu0 <- c(0, 0)
##D     sigma2 <- c(1., 1.)
##D     Gamma <- matrix(c(3, 0, 0, 3), nrow=2)
##D 
##D     sample <- matrix(0, nrow=sum(nlr), ncol=ns)
##D     for(i in 1:ns){
##D         alpha <- mvrnorm(1, rep(0, nr), Gamma)
##D         sampleR <- NULL
##D         for(g in 1:nr){
##D             beta <- rnorm(nlr[g], mean=alpha[g] + mu0[g], sd=sqrt(sigma2[g]))
##D             sampleR <- c(sampleR, beta)
##D         }
##D         sample[,i] <- sampleR
##D     }
##D 
##D     #run mcmc
##D     mcmc.result <- spatial.lme.mcmc(sample, nlr, 10000)
##D 
##D     #check the results
##D     Gamma <- mcmc.result$Gamma.save
##D     sigma2 <- mcmc.result$sigma2.save
##D     mu <- mcmc.result$mu.save
##D     matrix(rowMeans(Gamma), nr, nr)
##D     apply(sigma2, 1, function(x) quantile(x, prob=c(0.025, 0.5, 0.975)))
##D     summary(rowMeans(mu[1:nlr[1],]))
##D     summary(rowMeans(mu[(nlr[1]+1):sum(nlr),]))
##D     
## End(Not run)



