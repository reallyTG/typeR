library(qtl)


### Name: mqmfind.marker
### Title: Fetch significant markers after permutation analysis
### Aliases: mqmfind.marker
### Keywords: models

### ** Examples

# Use the multitrait dataset
data(multitrait)

# Set cofactors at each 3th marker
cof <- mqmsetcofactors(multitrait,3)

# impute missing genotypes
multitrait <- fill.geno(multitrait)

# log transform the 7th phenotype
multitrait <- transformPheno(multitrait, 7)

# Bootstrap 50 runs in batches of 10
## Not run: 
##D result <- mqmpermutation(multitrait,scanfunction=mqmscan,cofactors=cof,
##D                          pheno.col=7,n.perm=50,batchsize=10)
## End(Not run)## Don't show: 
result <- mqmpermutation(multitrait,scanfunction=mqmscan,cofactors=cof,
                         pheno.col=7,n.perm=2,batchsize=2)
## End(Don't show)

# Create a permutation object
f2perm <- mqmprocesspermutation(result)

# What LOD score is considered significant ?
summary(f2perm)

# Find markers with a significant QTL effect (First run is original phenotype data)
marker <- mqmfind.marker(multitrait,result[[1]],f2perm)

# Print it to the screen
marker



