library(broom.mixed)


### Name: tidy.MCMCglmm
### Title: Tidying methods for MCMC (Stan, JAGS, etc.) fits
### Aliases: tidy.MCMCglmm mcmc_tidiers tidyMCMC tidy.rjags tidy.stanfit
###   tidy.mcmc tidy.mcmc.list

### ** Examples

if (require("MCMCglmm")) {
  ## original model
  ## Not run: 
##D       mm0 <- MCMCglmm(Reaction ~ Days,
##D                  random = ~Subject, data = sleepstudy,
##D                  nitt=4000,
##D                  pr = TRUE
##D              )
##D    
## End(Not run)
   ## load stored object
   load(system.file("extdata","MCMCglmm_example.rda",
                                     package="broom.mixed"))
   tidy(mm0)
   tidy(mm1)
   tidy(mm2)
   tail(tidy(mm0,effects="ran_vals"))
}

# Using example from "RStan Getting Started"
# https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started

model_file <- system.file("extdata", "8schools.stan", package = "broom.mixed")
schools_dat <- list(J = 8,
                    y = c(28,  8, -3,  7, -1,  1, 18, 12),
                    sigma = c(15, 10, 16, 11,  9, 11, 10, 18))
## original model
## Not run: 
##D     set.seed(2015)
##D     rstan_example <- rstan::stan(file = model_file, data = schools_dat,
##D                          iter = 1000, chains = 2, save_dso = FALSE)
## End(Not run)
if (require(rstan)) {
   ## load stored object
   rstan_example <- readRDS(system.file("extdata", "rstan_example.rds", package = "broom.mixed"))
   tidy(rstan_example)
   tidy(rstan_example, conf.int = TRUE, pars = "theta")
   td_mean <- tidy(rstan_example, conf.int = TRUE)
   td_median <- tidy(rstan_example, conf.int = TRUE, robust = TRUE)

  if (require(dplyr) && require(ggplot2)) {
    tds <- rbind(mutate(td_mean, method = "mean"),
             mutate(td_median, method = "median")) %>%
       mutate(type=ifelse(grepl("^theta",term),"theta",
            ifelse(grepl("^eta",term),"eta",
                  "other")))

     ggplot(tds, aes(estimate, term)) +
      geom_errorbarh(aes(xmin = conf.low, xmax = conf.high),height=0) +
      geom_point(aes(color = method))+
      facet_wrap(~type,scale="free",ncol=1)
 } ## require(dplyr,ggplot2)
} ## require(rstan)
if (require(R2jags)) {
   ## see help("jags",package="R2jags")
   ## and  example("jags",package="R2jags")
   ## for details
   ## load stored object
   R2jags_example <- readRDS(system.file("extdata", "R2jags_example.rds", package = "broom.mixed"))
   tidy(R2jags_example)
   tidy(R2jags_example, conf.int=TRUE, conf.method="quantile")
}




