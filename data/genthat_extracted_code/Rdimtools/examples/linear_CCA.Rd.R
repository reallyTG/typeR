library(Rdimtools)


### Name: do.cca
### Title: Canonical Correlation Analysis
### Aliases: do.cca

### ** Examples

## Not run: 
##D ## generate 2 normal data matrices
##D mat1 = matrix(rnorm(100*12),nrow=100)+10 # 12-dim normal
##D mat2 = matrix(rnorm(100*6), nrow=100)-10 # 6-dim normal
##D 
##D ## project onto 2 dimensional space for each data
##D output = do.cca(mat1, mat2, ndim=2)
##D 
##D ## visualize
##D par(mfrow=c(1,2))
##D plot(output$Y1[,1], output$Y1[,2], main="proj(mat1)")
##D plot(output$Y2[,1], output$Y2[,2], main="proj(mat2)")
## End(Not run)




