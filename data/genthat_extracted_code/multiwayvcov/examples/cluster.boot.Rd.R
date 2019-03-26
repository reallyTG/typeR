library(multiwayvcov)


### Name: cluster.boot
### Title: Bootstrapped multi-way standard error clustering
### Aliases: cluster.boot
### Keywords: block boot bootstrap clustering errors multi-way robust
###   standard

### ** Examples

## Not run: 
##D library(lmtest)
##D data(petersen)
##D m1 <- lm(y ~ x, data = petersen)
##D 
##D # Cluster by firm
##D boot_firm <- cluster.boot(m1, petersen$firmid)
##D coeftest(m1, boot_firm)
##D 
##D # Cluster by firm using a formula
##D boot_firm <- cluster.boot(m1, ~ firmid)
##D coeftest(m1, boot_firm)
##D 
##D # Cluster by year
##D boot_year <- cluster.boot(m1, petersen$year)
##D coeftest(m1, boot_year)
##D 
##D # Double cluster by firm and year
##D boot_both <- cluster.boot(m1, cbind(petersen$firmid, petersen$year))
##D coeftest(m1, boot_both)
##D 
##D # Cluster by firm with wild bootstrap and custom wild distribution
##D boot_firm2 <- cluster.boot(m1, petersen$firmid, boot_type = "wild",
##D                            wild_type = function() sample(c(-1, 1), 1))
##D coeftest(m1, boot_firm)
##D 
##D # Go multicore using the parallel package
##D require(parallel)
##D cl <- makeCluster(4)
##D options(boot.ncpus = 4)
##D boot_both <- cluster.boot(m1, cbind(petersen$firmid, petersen$year), parallel = cl)
##D stopCluster(cl)
##D coeftest(m1, boot_both)
##D 
##D # Go multicore using the parallel package, let boot handle the parallelization
##D require(parallel)
##D options(boot.ncpus = 8)
##D boot_both <- cluster.boot(m1, cbind(petersen$firmid, petersen$year), parallel = TRUE)
##D coeftest(m1, boot_both)
## End(Not run)



