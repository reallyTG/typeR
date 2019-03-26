library(spatstat)


### Name: harmonise.fv
### Title: Make Function Tables Compatible
### Aliases: harmonise.fv harmonize.fv
### Keywords: spatial manip

### ** Examples

   H <- harmonise(K=Kest(cells), G=Gest(cells))
   H
   ## Not run: 
##D       ## generates a warning about duplicated columns
##D       try(cbind(H$K, H$G))
##D    
## End(Not run)



