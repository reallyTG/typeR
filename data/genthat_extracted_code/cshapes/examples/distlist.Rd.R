library(cshapes)


### Name: distlist
### Title: Compute distance lists on the CShapes dataset
### Aliases: distlist

### ** Examples

# Compute a list of minimum distances 
# for the international system on 1/1/1946
# using the Correlates of War list and the default accuracy
## Not run: dl <- distlist(as.Date("1946-1-1"), type="capdist", tolerance=0.5, useGW=FALSE)

# we eliminate duplicate dyads
## Not run: dl <- subset(dl, ccode1 < ccode2)



