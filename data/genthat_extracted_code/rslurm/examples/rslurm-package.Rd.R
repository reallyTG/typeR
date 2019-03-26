library(rslurm)


### Name: rslurm-package
### Title: Introduction to the 'rslurm' Package
### Aliases: rslurm-package

### ** Examples


## Not run: 
##D # Create a data frame of mean/sd values for normal distributions 
##D pars <- data.frame(par_m = seq(-10, 10, length.out = 1000), 
##D                    par_sd = seq(0.1, 10, length.out = 1000))
##D                    
##D # Create a function to parallelize
##D ftest <- function(par_m, par_sd) {
##D  samp <- rnorm(10^7, par_m, par_sd)
##D  c(s_m = mean(samp), s_sd = sd(samp))
##D }
##D 
##D sjob1 <- slurm_apply(ftest, pars)
##D print_job_status(sjob1)
##D res <- get_slurm_out(sjob1, "table")
##D all.equal(pars, res) # Confirm correct output
##D cleanup_files(sjob1)
## End(Not run)
  



