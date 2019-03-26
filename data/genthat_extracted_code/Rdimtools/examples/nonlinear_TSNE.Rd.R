library(Rdimtools)


### Name: do.tsne
### Title: t-distributed Stochastic Neighbor Embedding
### Aliases: do.tsne

### ** Examples

## Not run: 
##D ## generate swiss roll data
##D X = aux.gensamples(n=100)
##D 
##D ## compare different perplexity
##D out1 <- do.tsne(X, ndim=2, perplexity=5)
##D out2 <- do.tsne(X, ndim=2, perplexity=10)
##D out3 <- do.tsne(X, ndim=2, perplexity=50)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="tSNE::perplexity=5")
##D plot(out1$Y[,1], out1$Y[,2], main="tSNE::perplexity=10")
##D plot(out1$Y[,1], out1$Y[,2], main="tSNE::perplexity=50")
## End(Not run)




