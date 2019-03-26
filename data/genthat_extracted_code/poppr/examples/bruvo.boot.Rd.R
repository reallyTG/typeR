library(poppr)


### Name: bruvo.boot
### Title: Create a tree using Bruvo's Distance with non-parametric
###   bootstrapping.
### Aliases: bruvo.boot

### ** Examples

# Please note that the data presented is assuming that the nancycat dataset 
# contains all dinucleotide repeats, it most likely is not an accurate
# representation of the data.

# Load the nancycats dataset and construct the repeat vector.
data(nancycats)
ssr <- rep(2, 9)

# Analyze the 1st population in nancycats

bruvo.boot(popsub(nancycats, 1), replen = ssr)

## Not run: 
##D 
##D # Always load the library before you specify the function.
##D library("ape")
##D 
##D # Estimate the tree based off of the BIONJ algorithm.
##D 
##D bruvo.boot(popsub(nancycats, 9), replen = ssr, tree = bionj)
##D 
##D # Utilizing  balanced FastME
##D bruvo.boot(popsub(nancycats, 9), replen = ssr, tree = fastme.bal)
##D 
##D # To change parameters for the tree, wrap it in a function.
##D # For example, let's build the tree without utilizing subtree-prune-regraft
##D 
##D myFastME <- function(x) fastme.bal(x, nni = TRUE, spr = FALSE, tbr = TRUE)
##D bruvo.boot(popsub(nancycats, 9), replen = ssr, tree = myFastME)
##D 
## End(Not run)




