library(evolqg)


### Name: EigenTensorDecomposition
### Title: Eigentensor Decomposition
### Aliases: EigenTensorDecomposition EigenTensorDecomposition.list
###   EigenTensorDecomposition.default

### ** Examples

## Not run: 
##D data(dentus)
##D 
##D dentus.vcv <- daply (dentus, .(species), function(x) cov(x[,-5]))
##D 
##D dentus.vcv <- aperm(dentus.vcv, c(2, 3, 1))
##D 
##D dentus.etd <- EigenTensorDecomposition(dentus.vcv, TRUE)
##D 
##D # Plot some results
##D par(mfrow = c(1, 2))
##D plot(dentus.etd $ values, pch = 20, type = 'b', ylab = 'Eigenvalue')
##D plot(dentus.etd $ projection [, 1:2], pch = 20, 
##D      xlab = 'Eigentensor 1', ylab = 'Eigentensor 2')
##D text(dentus.etd $ projection [, 1:2],
##D      labels = rownames (dentus.etd $ projection), pos = 2)
##D 
##D # we can also deal with posterior samples of covariance matrices using plyr
##D 
##D dentus.models <- dlply(dentus, .(species), 
##D                        lm, formula = cbind(humerus, ulna, femur, tibia) ~ 1)
##D 
##D dentus.matrices <- llply(dentus.models, BayesianCalculateMatrix, samples = 100)
##D 
##D dentus.post.vcv <- laply(dentus.matrices, function (L) L $ Ps)
##D 
##D dentus.post.vcv <- aperm(dentus.post.vcv, c(3, 4, 1, 2))
##D 
##D # this will perform one eigentensor decomposition for each set of posterior samples
##D dentus.post.etd <- alply(dentus.post.vcv, 4, EigenTensorDecomposition)
##D 
##D # which would allow us to observe the posterior 
##D # distribution of associated eigenvalues, for instance
##D dentus.post.eval <- laply (dentus.post.etd, function (L) L $ values)
##D 
##D boxplot(dentus.post.eval, xlab = 'Index', ylab = 'Value', 
##D         main = 'Posterior Eigenvalue Distribution')
## End(Not run)



