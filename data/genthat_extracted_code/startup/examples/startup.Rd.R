library(startup)


### Name: renviron_d
### Title: Load .Renviron.d and .Rprofile.d directories during the R
###   startup process
### Aliases: renviron_d renviron rprofile_d rprofile startup

### ** Examples

## Not run: 
##D # The most common way to use the package is to add
##D # the following call to the ~/.Rprofile file.
##D startup::startup()
##D 
##D # For finer control of on exactly what files are used
##D # functions renviron_d() and rprofile_d() are also available:
##D 
##D # Initiate first .Renviron.d/ found on search path
##D startup::renviron_d()
##D 
##D # Initiate all .Rprofile.d/ directories found on the startup search path
##D startup::rprofile_d(all = TRUE)
## End(Not run)




