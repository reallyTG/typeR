library(rsvd)


### Name: rcur
### Title: Randomized CUR matrix decomposition.
### Aliases: rcur

### ** Examples

## Not run: 
##D # Load test image
##D data('tiger')
##D 
##D # Compute (column) randomized interpolative decompsition
##D # Note that the image needs to be transposed for correct plotting
##D out <- rcur(tiger, k = 150)
##D 
##D # Reconstruct image
##D tiger.re <- out$C %*% out$U %*% out$R
##D 
##D # Compute relative error
##D print(norm(tiger-tiger.re, 'F') / norm(tiger, 'F')) 
##D 
##D # Plot approximated image
##D image(tiger.re, col = gray((0:255)/255))
## End(Not run)



