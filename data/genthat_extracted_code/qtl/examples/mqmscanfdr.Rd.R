library(qtl)


### Name: mqmscanfdr
### Title: Estimate FDR for multiple trait QTL analysis
### Aliases: mqmscanfdr
### Keywords: models

### ** Examples

data(multitrait)

# impute missing genotype data
multitrait <- fill.geno(multitrait)
## Not run: 
##D # Calculate the thresholds
##D result <- mqmscanfdr(multitrait, threshold=10.0, n.perm=1000)
## End(Not run)## Don't show: 
  multitrait <- subset(multitrait, chr=1, ind=!apply(multitrait$pheno, 1, function(a) any(is.na(a))))
  multitrait$pheno <- multitrait$pheno[,1:3]
  result <- mqmscanfdr(multitrait, threshold=10.0, n.perm=2)
## End(Don't show)



