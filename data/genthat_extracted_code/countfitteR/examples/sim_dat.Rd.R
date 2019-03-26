library(countfitteR)


### Name: sim_dat
### Title: Data created from simulation of NB Poiss
### Aliases: sim_dat
### Keywords: datasets

### ** Examples

# code used to generate the data
# be warned: the simulations will take some time
## Not run: 
##D library(dplyr)
##D set.seed(15390)
##D sim_dat <- do.call(rbind, lapply(10^(-3L:2), function(single_theta)
##D   do.call(rbind, lapply(1L:10/2, function(single_lambda) 
##D     do.call(rbind, lapply(1L:100, function(single_rep) {
##D       
##D       foci <- lapply(1L:10, function(dummy) rnbinom(600, size = single_theta, mu = single_lambda))
##D       names(foci) <- paste0("C", 1L:10)
##D       
##D       fit_counts(foci, separate = TRUE, model = "all") %>%
##D         summary_fitlist %>% 
##D         mutate(between = single_lambda < upper & single_lambda > lower) %>%
##D         group_by(model) %>% 
##D         summarize(prop = mean(between)) %>%
##D         mutate(replicate = single_rep, lambda = single_lambda, theta = single_theta)
##D     }))
##D   ))
##D ))
## End(Not run)



