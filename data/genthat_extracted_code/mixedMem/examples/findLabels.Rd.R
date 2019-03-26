library(mixedMem)


### Name: findLabels
### Title: Mixed Membership Post-Processing
### Aliases: findLabels

### ** Examples

## Not run: 
##D # See mixedMemModel documentation for how to generate data and instantiate a mixedMemModel object
##D # After the data as been generated, we initialize the array of sub-population parameters (theta)
##D # according to a permutation of the true labeling
##D set.seed(123)
##D perm = sample.int(K, size = K, replace = FALSE)
##D theta1 = theta_truth[,perm,]
##D test_model <- mixedMemModel(Total = Total, J = J,Rj = Rj, Nijr= Nijr, K = K, Vj = Vj,dist = dist,
##D  obs = obs, alpha = alpha, theta = theta1)
##D out <- mmVarFit(test_model)
##D opt.perm <- findLabels(out, theta_truth)
##D opt.perm
##D 
##D # produce mixedMemModel object with sub-population labels permuted to best match
##D # the comparison model
##D out = permuteLabels(out, opt.perm$perm)
## End(Not run)



