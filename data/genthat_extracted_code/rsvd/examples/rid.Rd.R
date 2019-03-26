library(rsvd)


### Name: rid
### Title: Randomized interpolative decomposition (ID).
### Aliases: rid

### ** Examples

## Not run: 
##D # Load test image
##D data("tiger")
##D 
##D # Compute (column) randomized interpolative decompsition
##D # Note that the image needs to be transposed for correct plotting
##D out <- rid(t(tiger), k = 150)
##D 
##D # Show selected columns 
##D tiger.partial <- matrix(0, 1200, 1600)
##D tiger.partial[,out$idx] <- t(tiger)[,out$idx]
##D image(t(tiger.partial), col = gray((0:255)/255), useRaster = TRUE)
##D 
##D # Reconstruct image
##D tiger.re <- t(out$C %*% out$Z)
##D 
##D # Compute relative error
##D print(norm(tiger-tiger.re, 'F') / norm(tiger, 'F')) 
##D 
##D # Plot approximated image
##D image(tiger.re, col = gray((0:255)/255))
## End(Not run)



