library(spatialprobit)


### Name: LeSagePaceExperiment
### Title: Replicate the LeSage and Pace (2009), section 10.1.5 experiment
### Aliases: LeSagePaceExperiment

### ** Examples

## Not run: 
##D # LeSage/Pace(2009), Table 10.1, p.291: n=400, m=10
##D res1 <- LeSagePaceExperiment(n=400, beta=c(0,1,-1), rho=0.75, 
##D  ndraw=1000, burn.in=200, thinning=1, m=10)
##D res1$time
##D res1$coefficients
##D summary(res1)
##D 
##D # LeSage/Pace(2009), Table 10.1, p.291: n=1000, m=1
##D res2 <- LeSagePaceExperiment(n=1000, beta=c(0,1,-1), rho=0.75, 
##D   ndraw=1000, burn.in=200, thinning=1, m=1)
##D res2$time
##D res2$coefficients
##D summary(res2)
##D 
##D # LeSage/Pace(2009), Table 10.2, p.291: n=400, m=1
##D res400.1 <- LeSagePaceExperiment(n=400, beta=c(0,1,-1), rho=0.75, 
##D   ndraw=1000, burn.in=200, thinning=1, m=1)
##D summary(res400.1)
##D 
##D # LeSage/Pace(2009), Table 10.2, p.291: n=400, m=2
##D res400.2 <- LeSagePaceExperiment(n=400, beta=c(0,1,-1), rho=0.75, 
##D   ndraw=1000, burn.in=200, thinning=1, m=2)
##D summary(res400.2)
##D 
##D # LeSage/Pace(2009), Table 10.2, p.291: n=400, m=10
##D res400.10 <- LeSagePaceExperiment(n=400, beta=c(0,1,-1), rho=0.75, 
##D   ndraw=1000, burn.in=200, thinning=1, m=10)
##D summary(res400.10)
## End(Not run)



