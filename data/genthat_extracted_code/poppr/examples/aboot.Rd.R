library(poppr)


### Name: aboot
### Title: Calculate a dendrogram with bootstrap support using any distance
###   applicable to genind or genclone objects.
### Aliases: aboot bootstrap
### Keywords: bootstrap

### ** Examples


data(nancycats)
nan9 <- popsub(nancycats, 9)

set.seed(9999)
# Generate a tree using nei's distance
neinan <- aboot(nan9, dist = nei.dist)

set.seed(9999)
# Generate a tree using custom distance
bindist <- function(x) dist(tab(x), method = "binary")
binnan <- aboot(nan9, dist = bindist)

## Not run: 
##D # Distances from other packages.
##D #
##D # Sometimes, distance functions from other packages will have the constraint
##D # that the incoming data MUST be genind. Internally, aboot uses the 
##D # bootgen class ( class?bootgen ) to shuffle loci, and will throw an error
##D # The function bootgen2genind helps fix that. Here's an example of a function
##D # that expects a genind class from above
##D bindist <- function(x){
##D   stopifnot(is.genind(x))
##D   dist(tab(x), method = "binary")
##D }
##D #
##D # Fails:
##D # aboot(nan9, dist = bindist)
##D ## Error: is.genind(x) is not TRUE
##D #
##D # Add bootgen2genind to get it working!
##D # Works:
##D aboot(nan9, dist = function(x) bootgen2genind(x) %>% bindist)
##D 
##D # AFLP data
##D data(Aeut)
##D 
##D # Nei's distance
##D anei <- aboot(Aeut, dist = nei.dist, sample = 1000, cutoff = 50)
##D 
##D # Rogers' distance
##D arog <- aboot(Aeut, dist = rogers.dist, sample = 1000, cutoff = 50)
##D 
##D # This can also be run on genpop objects
##D strata(Aeut) <- other(Aeut)$population_hierarchy[-1]
##D Aeut.gc <- as.genclone(Aeut)
##D setPop(Aeut.gc) <- ~Pop/Subpop
##D Aeut.pop <- genind2genpop(Aeut.gc)
##D set.seed(5000)
##D aboot(Aeut.pop, sample = 1000) # compare to Grunwald et al. 2006
##D 
##D # You can also use the strata argument to convert to genpop inside the function.
##D set.seed(5000)
##D aboot(Aeut.gc, strata = ~Pop/Subpop, sample = 1000)
##D 
##D # And genlight objects 
##D # From glSim:
##D ## 1,000 non structured SNPs, 100 structured SNPs
##D x <- glSim(100, 1e3, n.snp.struc=100, ploid=2)
##D aboot(x, distance = bitwise.dist)
##D 
##D # Utilizing other tree methods
##D 
##D library("ape")
##D 
##D aboot(Aeut.pop, tree = fastme.bal, sample = 1000)
##D 
##D # Utilizing options in other tree methods
##D 
##D myFastME <- function(x) fastme.bal(x, nni = TRUE, spr = FALSE, tbr = TRUE)
##D aboot(Aeut.pop, tree = myFastME, sample = 1000)
##D 
## End(Not run)



