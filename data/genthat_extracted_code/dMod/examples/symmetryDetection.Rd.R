library(dMod)


### Name: symmetryDetection
### Title: Search for symmetries in the loaded model
### Aliases: symmetryDetection

### ** Examples

## Not run: 
##D eq <- NULL
##D eq <- addReaction(eq, "A", "B", "k1*A")
##D eq <- addReaction(eq, "B", "A", "k2*B")
##D 
##D observables <- eqnvec(Aobs = "alpha * A")
##D 
##D symmetryDetection(eq, observables)
##D 
## End(Not run)



