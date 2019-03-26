library(RSiena)


### Name: siena08
### Title: Function to perform a meta analysis of a collection of Siena
###   fits.
### Aliases: siena08
### Keywords: models

### ** Examples

## Not run: 
##D # A meta-analysis for three groups does not make much sense
##D # for generalizing to a population of networks,
##D # but the Fisher combinations of p-values are meaningful.
##D # However, using three groups does show the idea.
##D 
##D Group1 <- sienaDependent(array(c(N3401, HN3401), dim=c(45, 45, 2)))
##D Group3 <- sienaDependent(array(c(N3403, HN3403), dim=c(37, 37, 2)))
##D Group4 <- sienaDependent(array(c(N3404, HN3404), dim=c(33, 33, 2)))
##D dataset.1 <- sienaDataCreate(Friends = Group1)
##D dataset.3 <- sienaDataCreate(Friends = Group3)
##D dataset.4 <- sienaDataCreate(Friends = Group4)
##D OneAlgorithm <- sienaAlgorithmCreate(projname = "SingleGroups", seed=1234)
##D effects.1 <- getEffects(dataset.1)
##D effects.3 <- getEffects(dataset.3)
##D effects.4 <- getEffects(dataset.4)
##D effects.1 <- includeEffects(effects.1, transTrip)
##D effects.1 <- setEffect(effects.1, cycle3, fix=TRUE, test=TRUE)
##D effects.3 <- includeEffects(effects.3, transTrip)
##D effects.3 <- setEffect(effects.3, cycle3, fix=TRUE, test=TRUE)
##D effects.4 <- includeEffects(effects.4, transTrip)
##D effects.4 <- setEffect(effects.4, cycle3, fix=TRUE, test=TRUE)
##D ans.1 <- siena07(OneAlgorithm, data=dataset.1, effects=effects.1, batch=TRUE)
##D ans.3 <- siena07(OneAlgorithm, data=dataset.3, effects=effects.3, batch=TRUE)
##D ans.4 <- siena07(OneAlgorithm, data=dataset.4, effects=effects.4, batch=TRUE)
##D ans.1
##D ans.3
##D ans.4
##D (meta <- siena08(ans.1, ans.3, ans.4))
##D # For specifically presenting the Fisher combinations:
##D # First determine the components of meta with estimated effects:
##D which.est <- sapply(meta, function(x){ifelse(is.list(x),!is.null(x$cjplus),FALSE)})
##D Fishers <- t(sapply(1:sum(which.est),
##D         function(i){c(meta[[i]]$cjplus, meta[[i]]$cjminus,
##D                         meta[[i]]$cjplusp, meta[[i]]$cjminusp, 2*meta[[i]]$n1 )}))
##D Fishers <- as.data.frame(Fishers, row.names=names(meta)[which.est])
##D names(Fishers) <- c('Fplus', 'Fminus', 'pplus', 'pminus', 'df')
##D Fishers
##D round(Fishers,4)
## End(Not run)



