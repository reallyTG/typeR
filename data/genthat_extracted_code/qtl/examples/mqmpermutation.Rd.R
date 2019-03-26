library(qtl)


### Name: mqmpermutation
### Title: Estimate QTL LOD score significance using permutations or
###   simulations
### Aliases: mqmpermutation
### Keywords: models

### ** Examples

# Use the multitrait dataset
data(multitrait)

## Don't show: 
multitrait <- subset(multitrait, chr=1:2,
                     ind=!apply(multitrait$pheno, 1, function(a) any(is.na(a))))
multitrait$pheno <- log(multitrait$pheno)
## End(Don't show)

multitrait <- calc.genoprob(multitrait)
result <- mqmpermutation(multitrait,pheno.col=7, n.perm=2, batchsize=2)

## Not run: 
##D #Set 50 cofactors
##D cof <- mqmautocofactors(multitrait,50)
## End(Not run)## Don't show: 
cof <- mqmautocofactors(multitrait,5)
## End(Don't show)

multitrait <- fill.geno(multitrait)
result <- mqmpermutation(multitrait,scanfunction=mqmscan,cofactors=cof,
                         pheno.col=7, n.perm=2,batchsize=2,verbose=FALSE)

#Create a permutation object
f2perm <- mqmprocesspermutation(result)

#Get Significant LOD thresholds
summary(f2perm)



