library(aster2)


### Name: aster2-package
### Title: Aster Models
### Aliases: aster2-package aster2
### Keywords: package

### ** Examples

## Not run: 
##D # perfectly good example but takes longer to run than CRAN allows
##D data(echinacea)
##D #### estimate MLE (simpler model than in Biometrika paper cited, not as good)
##D hdct <- as.numeric(grepl("hdct", as.character(echinacea$redata$varb)))
##D modmat <- model.matrix(resp ~ varb + nsloc + ewloc + pop * hdct - pop,
##D     data = echinacea$redata)
##D tau.hat <- as.numeric(t(modmat) %*% echinacea$redata$resp)
##D beta.hat <- transformUnconditional(tau.hat, modmat, echinacea,
##D     from = "tau", to = "beta")
##D inverse.fisher <- jacobian(tau.hat, echinacea, transform = "unconditional",
##D     from = "tau", to = "beta", modmat = modmat)
##D #### now have MLE (beta.hat) and pseudo-inverse of Fisher information
##D #### (inverse.fisher), pseudo-inverse because modmat is not full rank
##D foo <- cbind(beta.hat, sqrt(diag(inverse.fisher)))
##D foo <- cbind(foo, foo[ , 1]/foo[ , 2])
##D foo <- cbind(foo, 2 * pnorm(- abs(foo[ , 3])))
##D dimnames(foo) <- list(colnames(modmat),
##D     c("Estimate", "Std. Error", "z value", "Pr(>|z|)"))
##D printCoefmat(foo)
##D #### coefficients constrained to be zero because parameterization is not
##D #### identifiable have estimate zero and std. error zero (and rest NA)
##D 
##D #### estimate fitness in populations
##D #### generate new data with one individual in each pop at location (0, 0)
##D pop.names <- levels(echinacea$redata$pop)
##D pop.idx <- match(pop.names, as.character(echinacea$redata$pop))
##D pop.id <- echinacea$redata$id[pop.idx]
##D newdata <- subset(echinacea, echinacea$redata$id %in% pop.id)
##D newdata$redata[ , "nsloc"] <- 0
##D newdata$redata[ , "ewloc"] <- 0
##D hdct <- as.integer(grepl("hdct", as.character(newdata$redata$varb)))
##D #### modmat for new data
##D newmodmat <- model.matrix(resp ~ varb + nsloc + ewloc + pop * hdct - pop,
##D     data = newdata$redata)
##D #### matrix that when multiplied mean value parameter vector gives fitness
##D #### in each pop
##D amat <- matrix(NA, nrow = length(pop.id), ncol = nrow(newmodmat))
##D for (i in 1:nrow(amat))
##D     amat[i, ] <- as.numeric(grepl(paste("^", pop.id[i], ".hdct", sep = ""),
##D         rownames(newmodmat)))
##D #### transform to expected fitness parameters
##D efit <- transformUnconditional(beta.hat, newmodmat, newdata,
##D     from = "beta", to = "mu")
##D efit <- as.numeric(amat %*% efit)
##D #### jacobian matrix of this transformation
##D jack <- jacobian(beta.hat, newdata, transform = "unconditional",
##D     from = "beta", to = "mu", modmat = newmodmat)
##D #### delta method standard errors
##D sefit <- sqrt(diag(amat %*% jack %*% inverse.fisher %*% t(jack) %*% t(amat)))
##D foo <- cbind(efit, sefit)
##D dimnames(foo) <- list(pop.names, c("Est. fitness", "Std. Error"))
##D print(foo)
## End(Not run)



