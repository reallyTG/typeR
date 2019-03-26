library(mirt)


### Name: residuals-method
### Title: Compute model residuals
### Aliases: residuals-method residuals,SingleGroupClass-method
###   residuals,MixtureClass-method residuals,MultipleGroupClass-method
###   residuals,DiscreteClass-method

### ** Examples


## Not run: 
##D 
##D x <- mirt(Science, 1)
##D residuals(x)
##D residuals(x, tables = TRUE)
##D residuals(x, type = 'exp')
##D residuals(x, suppress = .15)
##D residuals(x, df.p = TRUE)
##D 
##D # extract results manually
##D out <- residuals(x, df.p = TRUE, verbose=FALSE)
##D str(out)
##D out$df.p[1,2]
##D 
##D # with and without supplied factor scores
##D Theta <- fscores(x)
##D residuals(x, type = 'Q3', Theta=Theta)
##D residuals(x, type = 'Q3', method = 'ML')
##D 
## End(Not run)



