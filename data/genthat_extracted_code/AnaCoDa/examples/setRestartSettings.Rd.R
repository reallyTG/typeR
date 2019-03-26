library(AnaCoDa)


### Name: setRestartSettings
### Title: Set Restart Settings
### Aliases: setRestartSettings

### ** Examples


## set restart settings for checkpointing

samples <- 2500
thinning <- 50
adaptiveWidth <- 25

## estimate all parameter types
mcmc <- initializeMCMCObject(samples = samples, thinning = thinning, 
                             adaptive.width=adaptiveWidth, est.expression=TRUE, 
                             est.csp=TRUE, est.hyper=TRUE, est.mix = TRUE) 
                             
# prompts the mcmc to write a restart file every 100 samples during the run.
setRestartSettings(mcmc = mcmc, filename = "test_restart", samples = 100)

# prompts the mcmc to write a restart file every 100 samples during the run, 
# but will overwrite it each time.
setRestartSettings(mcmc = mcmc, filename = "test_restart", samples = 100, 
                   write.multiple = FALSE)
           



