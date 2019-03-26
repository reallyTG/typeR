library(NMF)


### Name: rss
### Title: Residual Sum of Squares and Explained Variance
### Aliases: evar evar,ANY-method evar-methods rss rss,ANY-method
###   rss,matrix-method rss-methods
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# rss,matrix-method
#----------
# RSS bewteeen random matrices
x <- rmatrix(20,10, max=50)
y <- rmatrix(20,10, max=50)
rss(x, y)
rss(x, x + rmatrix(x, max=0.1))

#----------
# rss,ANY-method
#----------
# RSS between an NMF model and a target matrix
x <- rmatrix(20, 10)
y <- rnmf(3, x) # random compatible model
rss(y, x)

# fit a model with nmf(): one should do better
y2 <- nmf(x, 3) # default minimizes the KL-divergence
rss(y2, x)
y2 <- nmf(x, 3, 'lee') # 'lee' minimizes the RSS
rss(y2, x)



