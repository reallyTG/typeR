library(adegenet)


### Name: snapclust
### Title: Maximum-likelihood genetic clustering using EM algorithm
### Aliases: snapclust

### ** Examples

## Not run: 
##D data(microbov)
##D 
##D ## try function using k-means initialization
##D grp.ini <- find.clusters(microbov, n.clust=15, n.pca=150)
##D 
##D ## run EM algo
##D res <- snapclust(microbov, 15, pop.ini = grp.ini$grp)
##D names(res)
##D res$converged
##D res$n.iter
##D 
##D ## plot result
##D compoplot(res)
##D 
##D ## flag potential hybrids
##D to.flag <- apply(res$proba,1,max)<.9
##D compoplot(res, subset=to.flag, show.lab=TRUE,
##D                  posi="bottomleft", bg="white")
##D 
##D 
##D ## Simulate hybrids F1
##D zebu <- microbov[pop="Zebu"]
##D salers <- microbov[pop="Salers"]
##D hyb <- hybridize(zebu, salers, n=30)
##D x <- repool(zebu, salers, hyb)
##D 
##D ## method without hybrids
##D res.no.hyb <- snapclust(x, k=2, hybrids=FALSE)
##D compoplot(res.no.hyb, col.pal=spectral, n.col=2)
##D 
##D ## method with hybrids
##D res.hyb <- snapclust(x, k=2, hybrids=TRUE)
##D compoplot(res.hyb, col.pal =
##D           hybridpal(col.pal = spectral), n.col = 2)
##D 
##D 
##D ## Simulate hybrids backcross (F1 / parental)
##D f1.zebu <- hybridize(hyb, zebu, 20, pop = "f1.zebu")
##D f1.salers <- hybridize(hyb, salers, 25, pop = "f1.salers")
##D y <- repool(x, f1.zebu, f1.salers)
##D 
##D ## method without hybrids
##D res2.no.hyb <- snapclust(y, k = 2, hybrids = FALSE)
##D compoplot(res2.no.hyb, col.pal = hybridpal(), n.col = 2)
##D 
##D ## method with hybrids F1 only
##D res2.hyb <- snapclust(y, k = 2, hybrids = TRUE)
##D compoplot(res2.hyb, col.pal = hybridpal(), n.col = 2)
##D 
##D ## method with back-cross
##D res2.back <- snapclust(y, k = 2, hybrids = TRUE, hybrid.coef = c(.25,.5))
##D  compoplot(res2.back, col.pal = hybridpal(), n.col = 2)
##D 
## End(Not run)



