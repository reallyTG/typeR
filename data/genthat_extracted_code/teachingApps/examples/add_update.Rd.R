library(teachingApps)


### Name: add_update
### Title: Add an update to a shiny app
### Aliases: add_update

### ** Examples

# In the \code{teachingApps} package, apps are stored in the 
# \code{inst/apps/} directory. 
## Not run: 
##D  
##D teachingApps::add_update(local_pkg = file.choose(),
##D                          'apps',
##D                          app_name = 'maximum_likelihood')
## End(Not run)

# Open an app directory to make and push updates

## Not run: 
##D  
##D teachingApps::add_update(local_pkg = file.choose(),
##D                          'apps',
##D                          app_name = 'maximum_likelihood',
##D                          open_dir = TRUE)
## End(Not run)



