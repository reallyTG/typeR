library(randomLCA)


### Name: pap
### Title: Positive Action program implementation
### Aliases: pap
### Keywords: datasets

### ** Examples

# standard latent class
pap.lca1 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=1)
pap.lca2 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=2)
## Not run: 
##D # standard latent class
##D pap.lca3 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=3)
##D pap.lca4 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=4)
##D pap.lca5 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=5)
##D 
##D # repeat with random effect with constant loading
##D # once BIC increases fitting further models is unnecessary
##D pap.lca1random <- randomLCA(pap[,1:10],
##D           freq=pap$Freq,nclass=1,random=TRUE)
##D pap.lca2random <- randomLCA(pap[,1:10],
##D           freq=pap$Freq,nclass=2,random=TRUE)
##D pap.lca3random <- randomLCA(pap[,1:10],
##D           freq=pap$Freq,nclass=3,random=TRUE)
##D # can also repeat fits without constant loading to give mixture of IRT models
##D pap.lca1random2 <- randomLCA(pap[,1:10],
##D           freq=pap$Freq,nclass=1,random=TRUE,constload=FALSE)
##D 
##D pap.lca2random2 <- randomLCA(pap[,1:10],
##D           freq=pap$Freq,nclass=2,random=TRUE,constload=FALSE)
##D 
##D pap.lca3random2 <- randomLCA(pap[,1:10],
##D           freq=pap$Freq,nclass=3,random=TRUE,constload=FALSE)
##D 
##D # produce table of BIC values
##D # shows 4 class best of standard latent class
##D # but 2 class latent class with constant loading has better BIC
##D pap.bic <- data.frame(bic=c(BIC(pap.lca1),BIC(pap.lca2),BIC(pap.lca3),BIC(pap.lca4),BIC(pap.lca5)),
##D                       bic2=c(BIC(pap.lca1random),BIC(pap.lca2random),BIC(pap.lca3random),NA,NA),
##D                       bic3=c(BIC(pap.lca1random2),BIC(pap.lca2random2),BIC(pap.lca3random2),NA,NA))
##D print(pap.bic)
##D # plot 4 class standard
##D plot(pap.lca4,type="b")
##D # plot 2 class standard
##D plot(pap.lca2random,type="b")
## End(Not run)



