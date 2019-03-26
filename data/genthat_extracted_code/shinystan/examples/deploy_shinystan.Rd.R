library(shinystan)


### Name: deploy_shinystan
### Title: Deploy a 'ShinyStan' app on the web using 'shinyapps.io' by
###   'RStudio'
### Aliases: deploy_shinystan

### ** Examples

## Not run: 
##D # For this example assume sso is the name of the \code{shinystan} object for
##D # the model you want to use. Assume also that you want to name your app
##D # 'my-model' and that your shinyapps.io username is 'username'.
##D 
##D deploy_shinystan(sso, appName = "my-model", account = "username")
##D 
##D # If you only have one ShinyApps account configured then you can also omit
##D # the 'account' argument.
##D 
##D deploy_shinystan(sso, appName = "my-model")
## End(Not run)




