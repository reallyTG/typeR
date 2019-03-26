library(GibbsACOV)


### Name: GibbsACOV-package
### Title: Gibbs Sampler for One-Way Mixed-Effects ANOVA and ANCOVA Models
### Aliases: GibbsACOV-package GibbsACOV
### Keywords: GibbsACOV

### ** Examples

## Not run: 
##D # ANCOVA with 2 continuous predictors and 5 factor levels
##D   data(corn)
##D   init1 <- c(rep(0,7), 1, 1)
##D   init2 <- c(rnorm(7), rgamma(2,2,1))
##D   init3 <- c(rnorm(7), rgamma(2,2,1))
##D   init4 <- c(rnorm(7), rgamma(2,2,1))
##D   initval <- rbind(init1, init2, init3, init4)
##D   acovamcmc(corn$yield, corn$variety, cbind((corn$nitrogen)^2, corn$nitrogen), 4, 10000 , initval)
##D   
##D # ANOVA with grand mean parameterization and 12 factor levels
##D   data(csection)
##D   init1 <- c(rep(0,13), 1, 1)
##D   init2 <- c(rnorm(13), rgamma(2,2,1))
##D   init3 <- c(rnorm(13), rgamma(2,2,1))
##D   init4 <- c(rnorm(13), rgamma(2,2,1))
##D   initval <- rbind(init1, init2, init3, init4)
##D   Y = log(csection$rate / (1-csection$rate))
##D   acovamcmc(Y, factor(csection$hospital), matrix(1,length(csection$hospital),1), 4, 10000, initval)
## End(Not run)



