library(phangorn)


### Name: pmlMix
### Title: Phylogenetic mixture model
### Aliases: pmlMix pmlPen
### Keywords: cluster

### ** Examples


## Not run: 
##D X <- allSitePattern(5)
##D tree <- read.tree(text = "((t1:0.3,t2:0.3):0.1,(t3:0.3,t4:0.3):0.1,t5:0.5);")
##D fit <- pml(tree,X, k=4)
##D weights <- 1000*exp(fit$site) 
##D attr(X, "weight") <- weights
##D fit1 <- update(fit, data=X, k=1)
##D fit2 <- update(fit, data=X)
##D 
##D (fitMixture <- pmlMix(edge~rate, fit1 , m=4))
##D (fit2 <- optim.pml(fit2, optGamma=TRUE))
##D 
##D 
##D data(Laurasiatherian)
##D dm <- dist.logDet(Laurasiatherian)
##D tree <- NJ(dm)
##D fit <- pml(tree, Laurasiatherian)
##D fit <- optim.pml(fit)
##D 
##D fit2 <- update(fit, k=4)
##D fit2 <- optim.pml(fit2, optGamma=TRUE)
##D 
##D fitMix <- pmlMix(edge ~ rate, fit, m=4)
##D fitMix
##D 
##D 
##D #
##D # simulation of mixture models 
##D #
##D \dontrun{
##D X <- allSitePattern(5)
##D tree1 <- read.tree(text = "((t1:0.1,t2:0.5):0.1,(t3:0.1,t4:0.5):0.1,t5:0.5);")
##D tree2 <- read.tree(text = "((t1:0.5,t2:0.1):0.1,(t3:0.5,t4:0.1):0.1,t5:0.5);")
##D tree1 <- unroot(tree1)
##D tree2 <- unroot(tree2)
##D fit1 <- pml(tree1,X)
##D fit2 <- pml(tree2,X)
##D 
##D weights <- 2000*exp(fit1$site) + 1000*exp(fit2$site)
##D attr(X, "weight") <- weights
##D 
##D fit1 <- pml(tree1, X)
##D fit2 <- optim.pml(fit1)
##D logLik(fit2)
##D AIC(fit2, k=log(3000))
##D 
##D fitMixEdge <- pmlMix( ~ edge, fit1, m=2)
##D logLik(fitMixEdge)
##D AIC(fitMixEdge, k=log(3000))
##D 
##D fit.p <- pmlPen(fitMixEdge, .25)
##D logLik(fit.p)
##D AIC(fit.p, k=log(3000))
##D }
## End(Not run)




