library(secr)


### Name: join
### Title: Combine or Split Sessions of capthist Object
### Aliases: join unjoin
### Keywords: manip

### ** Examples


joined.ovenCH <- join (ovenCH)
summary(joined.ovenCH)
attr(joined.ovenCH, "intervals")

summary(unjoin(joined.ovenCH))

## Not run: 
##D 
##D ## suppose the 5-year ovenbird covariates include a column for weight
##D ## (here generated as random numbers)
##D for (i in 1:5) covariates(ovenCH[[i]])$wt <- runif(nrow(ovenCH[[i]]))
##D ## construct single-session version of data for openCR
##D ## identify 'wt' as varying across years
##D ovenCHj <- join(ovenCH, timevaryingcov = 'wt')
##D head(covariates(ovenCHj))
##D timevaryingcov(ovenCHj)
##D ## Use example: openCR.fit(ovenCHj, model = p~wt)
##D 
## End(Not run)





