library(AnaCoDa)


### Name: loadMCMCObject
### Title: Load MCMC Object
### Aliases: loadMCMCObject

### ** Examples


## loading mcmc objects from the filesystem
## Not run: 
##D # load one mcmc object
##D mcmc <- loadMCMCObject(files = "mcmc.Rda")
##D 
##D # load and combine multiple mcmc objects. Useful when using checkpointing
##D mcmc <- loadMCMCObject(files = c("mcmc1.Rda", "mcmc2.Rda"))
## End(Not run)



