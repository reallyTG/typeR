library(evolqg)


### Name: ProjectMatrix
### Title: Project Covariance Matrix
### Aliases: ProjectMatrix

### ** Examples

# this function is useful for projecting posterior samples for a set of 
# covariance matrices onto the eigentensor decomposition done 
# on their estimated means
## Not run: 
##D data(dentus)
##D 
##D dentus.models <- dlply(dentus, .(species), lm, 
##D                        formula = cbind(humerus, ulna, femur, tibia) ~ 1)
##D 
##D dentus.matrices <- llply(dentus.models, BayesianCalculateMatrix, samples = 100)
##D 
##D dentus.post.vcv <- laply(dentus.matrices, function (L) L $ Ps)
##D dentus.post.vcv <- aperm(dentus.post.vcv, c(3, 4, 1, 2))
##D 
##D dentus.mean.vcv <- aaply(dentus.post.vcv, 3, MeanMatrix)
##D dentus.mean.vcv <- aperm(dentus.mean.vcv, c(2, 3, 1))
##D 
##D dentus.mean.etd <- EigenTensorDecomposition(dentus.mean.vcv)
##D dentus.mean.proj <- data.frame('species' = LETTERS [1:5], dentus.mean.etd $ projection)
##D 
##D dentus.post.proj <- adply(dentus.post.vcv, c(3, 4), ProjectMatrix, etd = dentus.mean.etd)
##D colnames(dentus.post.proj) [1:2] <- c('species', 'sample')
##D levels(dentus.post.proj $ species) <- LETTERS[1:5]
##D 
##D require(ggplot2)
##D ggplot() +
##D   geom_point(aes(x = ET1, y = ET2, color = species), 
##D      data = dentus.mean.proj, shape = '+', size = 8) +
##D   geom_point(aes(x = ET1, y = ET2, color = species), 
##D      data = dentus.post.proj, shape = '+', size = 3) +
##D   theme_bw()
## End(Not run)



