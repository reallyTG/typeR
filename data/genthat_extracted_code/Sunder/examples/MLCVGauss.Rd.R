library(Sunder)


### Name: MLCVGauss
### Title: Inference and model selection under the assumption of Gaussian
###   distribution of allele counts
### Aliases: MLCVGauss
### Keywords: Likelihood inference Model selection

### ** Examples

## Not run: 
##D nsite <- 200
##D nloc <- 1000
##D hap.pop.size <- 100
##D theta <- c(runif(n=1,.5,10),
##D            runif(n=1,.01,10),
##D            runif(n=1,.01,10),
##D            runif(n=1,.5,1),
##D            runif(n=1,.01,.1)
##D            )
##D mod <- 'G+E' 
##D dat <- SimSunderData(mod=mod,
##D                      theta=theta,
##D                      nsite=nsite,
##D                      nloc=nloc,
##D                      hap.pop.size=hap.pop.size,
##D                      nalM=2,nalm=2, #bi-allelic loci
##D                      var.par=1,
##D                      scale.par=3)
##D gen <- dat$gen[,,1]
##D D_G <- dat$D_G
##D D_E <- dat$D_E
##D 
##D res <- MLCVGauss(gen,D_G,D_E,
##D                  ntrain=nrow(gen)/2,
##D                  nresamp=3)
##D 
##D which.max(res$mod.lik)
## End(Not run)



