library(EstimateGroupNetwork)


### Name: EstimateGroupNetwork
### Title: Estimate Joint Graphical Lasso model on data collected on
###   observations from different groups.
### Aliases: EstimateGroupNetwork
### Keywords: graphs multivariate

### ** Examples

# Toy example, two identical networks with two nodes.
# This example is only meant to test the package. The number
# of candidate lambda1 and lambda2 values (nlambda1 and nlambda2) was
# reduced to 2 to speed up computations for CRAN checking.
Sigma <- list()
Sigma[[1]] <- Sigma[[2]] <- matrix(c(1, .5,
                                     .5, 1), nrow = 2)
recovered <- EstimateGroupNetwork(X = Sigma, n = c(100, 100),
                                  nlambda1 = 2, nlambda2 = 2, optimize = FALSE)

## Not run: 
##D library("qgraph")
##D library("parallel")
##D library("psych")
##D library("mvtnorm")
##D 
##D ncores <- 1
##D # uncomment for parallel processing
##D # ncores <- detectCores() -1
##D 
##D # In this example, the BFI network of males and females are compared
##D # Load BFI data
##D data(bfi)
##D 
##D # remove observations with missing values
##D bfi2 <- bfi[rowSums(is.na(bfi[,1:26])) == 0,]
##D 
##D # Compute correlations:
##D CorMales <- cor_auto(bfi2[bfi2$gender == 1,1:25])
##D CorFemales <- cor_auto(bfi2[bfi2$gender == 2,1:25])
##D 
##D # Estimate JGL:
##D Res <- EstimateGroupNetwork(list(males = CorMales, females = CorFemales),
##D                             n = c(sum(bfi2$gender == 1),sum(bfi2$gender == 2)))
##D 
##D # Plot:
##D Layout <- averageLayout(Res$males,Res$females)
##D layout(t(1:2))
##D qgraph(Res$males, layout = Layout, title = "Males (JGL)")
##D qgraph(Res$females, layout = Layout, title = "Females (JGL)")
##D 
##D 
##D 
##D # Example with simluated data
##D # generate three network structures, two are identical and one is different
##D nets <- list()
##D nets[[1]] <- matrix(c(0, .3, 0, .3,
##D                       .3, 0, -.3, 0,
##D                       0, -.3, 0, .2,
##D                       .3, 0, .2, 0), nrow = 4)
##D 
##D nets[[2]] <- matrix(c(0, .3, 0, .3,
##D                       .3, 0, -.3, 0,
##D                       0, -.3, 0, .2,
##D                       .3, 0, .2, 0), nrow = 4)
##D 
##D nets[[3]] <- matrix(c(0, .3, 0, 0,
##D                       .3, 0, -.3, 0,
##D                       0, -.3, 0, .2,
##D                       0, 0, .2, 0), nrow = 4)
##D 
##D # optional: plot the original netwotk structures
##D par(mfcol = c(3, 1))
##D lapply(nets, qgraph, edge.labels = TRUE)
##D 
##D # generate nobs = 500 observations from each of the three networks
##D nobs <- 500
##D nvar <- ncol(nets[[1]])
##D set.seed(1)
##D X <- lapply(nets, function(x) as.data.frame(rmvnorm(nobs, sigma = cov2cor(solve(diag(nvar)-x)))))
##D 
##D # use EstimateGroupNetwork for recovering the original structures
##D recnets <- list()
##D 
##D # using EBICglasso
##D recnets$glasso <- list()
##D recnets$glasso[[1]] <- EBICglasso(S = cor(X[[1]]), n = nobs)
##D recnets$glasso[[2]] <- EBICglasso(S = cor(X[[2]]), n = nobs)
##D recnets$glasso[[3]] <- EBICglasso(S = cor(X[[3]]), n = nobs)
##D 
##D # Using Akaike information criterion without count.unique option
##D recnets$AIC1 <- EstimateGroupNetwork(X = X, method = "InformationCriterion",
##D criterion = "aic", ncores = ncores)
##D # Using Akaike information criterion with count.unique option
##D recnets$AIC2 <- EstimateGroupNetwork(X = X, method = "InformationCriterion",
##D criterion = "aic", ncores = ncores, count.unique = TRUE)
##D # Using Bayes information criterion without count.unique option
##D recnets$BIC1 <- EstimateGroupNetwork(X = X, method = "InformationCriterion",
##D criterion = "bic", ncores = ncores)
##D # Using Bayes information criterion with count.unique option
##D recnets$BIC2 <- EstimateGroupNetwork(X = X, method = "InformationCriterion",
##D criterion = "bic", ncores = ncores, count.unique = TRUE)
##D # Using extended Bayes information criterion (gamma = .5 by default)
##D # without count.unique option
##D recnets$eBIC1 <- EstimateGroupNetwork(X = X, method = "InformationCriterion",
##D ncores = ncores, criterion = "ebic")
##D # Using extended Bayes information criterion (gamma = .5 by default) with
##D # count.unique option
##D recnets$eBIC2 <- EstimateGroupNetwork(X = X, method = "InformationCriterion",
##D ncores = ncores, criterion = "ebic", count.unique = TRUE)
##D # Use a more computationally intensive search strategy
##D recnets$eBIC3 <- EstimateGroupNetwork(X = X, method = "InformationCriterion",
##D ncores = ncores, criterion = "ebic", count.unique = TRUE, strategy = "simultaneous")
##D # Add also the "optimization" stage, which may or may not improve the results
##D # (but cannot do any harm either)
##D recnets$eBIC3 <- EstimateGroupNetwork(X = X, method = "InformationCriterion",
##D ncores = ncores, criterion = "ebic", count.unique = TRUE, strategy = "simultaneous",
##D optimize = TRUE)
##D # Using k-fold crossvalidation (k = 10 by default)
##D recnets$cv <- EstimateGroupNetwork(X = X, method = "crossvalidation",
##D ncores = ncores, seed = 1)
##D 
##D # Compare each network with the data generating network using correlations
##D correl <- data.frame(matrix(nrow = length(recnets), ncol = length(nets)))
##D row.names(correl) <- names(recnets)
##D 
##D for(i in seq_along(recnets))
##D {
##D   for(j in seq_along(nets))
##D       {
##D     nt1 <- nets[[j]]
##D     nt2 <- recnets[[i]][[j]]
##D     correl[i, j] <-  cor(nt1[lower.tri(nt1)], nt2[lower.tri(nt2)])
##D   }
##D }
##D correl
##D 
##D # sort the methods in order of performance in recovering the original network
##D # notice that this is not a complete simulation and is not indicative of performance
##D # in settings other than this one
##D sort(rowMeans(correl))
##D 
## End(Not run)



