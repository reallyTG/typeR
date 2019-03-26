library(Rdimtools)


### Name: do.sammon
### Title: Sammon Mapping
### Aliases: do.sammon

### ** Examples

## Not run: 
##D ## generate default dataset
##D ## in order to pass CRAN pretest, n is set to be small.
##D X <- aux.gensamples(n=99)
##D 
##D ## compare two initialization
##D out1 = do.sammon(X,ndim=2)                   # random projection
##D out2 = do.sammon(X,ndim=2,initialize="pca")  # pca as initialization
##D 
##D par(mfrow=c(1,2))
##D plot(out1$Y[,1],out1$Y[,2],main="out1:rndproj")
##D plot(out2$Y[,1],out2$Y[,2],main="out2:pca")
## End(Not run)




