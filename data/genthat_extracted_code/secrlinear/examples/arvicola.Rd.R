library(secrlinear)


### Name: Arvicola
### Title: Water Vole Capture Dataset
### Aliases: arvicola
### Keywords: datasets

### ** Examples


head(traps(arvicola))

## for speed, pre-compute distance matrix
userd <- networkdistance (traps(arvicola), glymemask, glymemask)
## fit model
glymefit <- secr.fit(arvicola, mask = glymemask, trace = FALSE,
                     details = list(userdist = userd))
## estimates of 'real' parameters
predict(glymefit)

## Not run: 
##D summary(arvicola)
##D 
##D tmp <- secr.test(glymefit, nsim = 1000)
##D tmp
##D plot(tmp)
##D 
##D ## More voles were caught only once than is predicted by the model.
##D ## This is probably due to within-population variation in movement or
##D ## capture probability.
##D 
## End(Not run)




