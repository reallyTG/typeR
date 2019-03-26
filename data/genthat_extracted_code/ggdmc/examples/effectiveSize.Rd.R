library(ggdmc)


### Name: effectiveSize_hyper
### Title: Calculate effective sample sizes
### Aliases: effectiveSize_hyper effectiveSize_many effectiveSize_one
###   effectiveSize

### ** Examples

#################################40
## effectiveSize example
#################################40
## Not run: 
##D es1 <- effectiveSize_one(hsam[[1]], 1, 100, 2, TRUE)
##D es2 <- effectiveSize_one(hsam[[1]], 1, 100, 2, FALSE)
##D es3 <- effectiveSize_many(hsam, 1, 100, TRUE)
##D es4 <- effectiveSize_many(hsam, 1, 100, FALSE)
##D es5 <- effectiveSize_hyper(hsam, 1, 100, 2, TRUE)
##D es6 <- effectiveSize(hsam, TRUE, 1, 100, 2, TRUE)
##D es7 <- effectiveSize(hsam, TRUE, 1, 100, 2, FALSE)
##D es8 <- effectiveSize(hsam, FALSE, 1, 100, 2, TRUE)
##D es9 <- effectiveSize(hsam, FALSE, 1, 100, 2, FALSE)
##D es10 <- effectiveSize(hsam[[1]], FALSE, 1, 100, 2, TRUE)
## End(Not run)



