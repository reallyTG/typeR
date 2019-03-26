library(poppr)


### Name: bitwise.dist
### Title: Calculate dissimilarity or Euclidean distance for genlight
###   objects
### Aliases: bitwise.dist

### ** Examples

set.seed(999)
x <- glSim(n.ind = 10, n.snp.nonstruc = 5e2, n.snp.struc = 5e2, ploidy = 2)
x
# Assess fraction of different alleles
system.time(xd <- bitwise.dist(x, threads = 1L))
xd

# Calculate Euclidean distance
system.time(xdt <- bitwise.dist(x, euclidean = TRUE, scale_missing = TRUE, threads = 1L))
xdt

## Not run: 
##D 
##D # This function is more efficient in both memory and speed than [dist()] for
##D # calculating Euclidean distance on genlight objects. For example, we can
##D # observe a clear speed increase when we attempt a calculation on 100k SNPs
##D # with 10% missing data:
##D 
##D set.seed(999)
##D mat <- matrix(sample(c(0:2, NA), 
##D                      100000 * 50, 
##D                      replace = TRUE, 
##D                      prob = c(0.3, 0.3, 0.3, 0.1)),
##D               nrow = 50)
##D glite <- new("genlight", mat, ploidy = 2)
##D 
##D # Default Euclidean distance 
##D system.time(dist(glite))
##D 
##D # Bitwise dist
##D system.time(bitwise.dist(glite, euclidean = TRUE, scale_missing = TRUE))
##D 
## End(Not run)



