library(archetypes)


### Name: stepArchetypes
### Title: Run archetypes algorithm repeatedly
### Aliases: stepArchetypes

### ** Examples

## Not run: 
##D   data(skel)
##D   skel2 <- subset(skel, select=-Gender)
##D   as <- stepArchetypes(skel2, k=1:5, verbose=FALSE)
##D 
##D   ## Residual sum of squares curve:
##D   screeplot(as)
##D 
##D   ## Select three archetypes and from that the best
##D   ## recurrence:
##D   a3 <- bestModel(as[[3]])
##D   
## End(Not run)



