library(rstan)


### Name: sflist2stanfit
### Title: Merge a list of stanfit objects into one
### Aliases: sflist2stanfit

### ** Examples
## Not run: 
##D library(rstan)
##D scode <- "
##D data {
##D   int<lower=1> N;
##D } 
##D parameters {
##D   real y1[N]; 
##D   real y2[N]; 
##D } 
##D model {
##D   y1 ~ normal(0, 1);
##D   y2 ~ double_exponential(0, 2);
##D } 
##D "
##D seed <- 123 # or any other integer 
##D foo_data <- list(N = 2)
##D foo <- stan(model_code = scode, data = foo_data, chains = 1, iter = 1)
##D f1 <- stan(fit = foo, data = foo_data, chains = 1, seed = seed, chain_id = 1) 
##D f2 <- stan(fit = foo, data = foo_data, chains = 2, seed = seed, chain_id = 2:3) 
##D f12 <- sflist2stanfit(list(f1, f2)) 
##D 
##D ## parallel stan call for unix-like OS
##D library(parallel)
##D 
##D if (.Platform$OS.type == "unix") {
##D sflist1 <- 
##D   mclapply(1:4, mc.cores = 2, 
##D            function(i) stan(fit = foo, data = foo_data, seed = seed, 
##D 	                    chains = 1, chain_id = i, refresh = -1))
##D f3 <- sflist2stanfit(sflist1)
##D }
##D if (.Platform$OS.type == "windows") { # also works on non-Windows
##D CL <- makeCluster(2)
##D clusterExport(cl = CL, c("foo_data", "foo", "seed")) 
##D sflist1 <- parLapply(CL, 1:4, fun = function(cid) {  
##D   require(rstan)
##D   stan(fit = foo, data = foo_data, chains = 1, 
##D        iter = 2000, seed = seed, chain_id = cid)
##D })
##D 
##D fit <- sflist2stanfit(sflist1)
##D print(fit)
##D stopCluster(CL)
##D } # end example for Windows 
## End(Not run)


