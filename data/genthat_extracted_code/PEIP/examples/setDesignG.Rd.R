library(PEIP)


### Name: setDesignG
### Title: Set a Design Matrix.
### Aliases: setDesignG
### Keywords: misc

### ** Examples

G = setDesignG()

### show the 56-th row
g = matrix( G[56,] , ncol=16, nrow=16)
imagesc(g)

## Not run: 
##D ### show total coverage
##D zim = matrix(0 , ncol=16, nrow=16)
##D for(i in 1:dim(G)[1])
##D {
##D g = matrix( G[i,] , ncol=16, nrow=16)
##D zim =zim + g
##D }
##D image(zim)
##D 
##D 
## End(Not run)




