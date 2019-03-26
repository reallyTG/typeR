library(rsconnect)


### Name: deployApp
### Title: Deploy an Application
### Aliases: deployApp

### ** Examples

## Not run: 
##D 
##D # deploy the application in the current working dir
##D deployApp()
##D 
##D # deploy an application in another directory
##D deployApp("~/projects/shiny/app1")
##D 
##D # deploy using an alternative application name and title
##D deployApp("~/projects/shiny/app1", appName = "myapp",
##D           appTitle = "My Application")
##D 
##D # deploy specifying an explicit account name, then
##D # redeploy with no arguments (will automatically use
##D # the previously specified account)
##D deployApp(account = "jsmith")
##D deployApp()
##D 
##D # deploy but don't launch a browser when completed
##D deployApp(launch.browser = FALSE)
## End(Not run)



