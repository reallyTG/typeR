library(startup)


### Name: restart
### Title: Restarts R
### Aliases: restart

### ** Examples

## Not run: 
##D   ## Relaunch R with debugging of startup::startup() enabled
##D   startup::restart(envvars = c(R_STARTUP_DEBUG = TRUE))
##D 
##D   ## Relaunch R without loading user Rprofile files
##D   startup::restart(args = "--no-init-file")
##D 
##D   ## Mimic 'R CMD build' and 'R CMD check'
##D   startup::restart(as = "R CMD build")
##D   startup::restart(as = "R CMD check")
##D   ## ... which are both short for
##D   startup::restart(args = c("--no-restore"),
##D                    envvars = c(R_DEFAULT_PACKAGES="", LC_COLLATE="C"))
## End(Not run)




