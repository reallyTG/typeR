library(qtl)


### Name: multitrait
### Title: Example Cross object from R/QTL with multiple traits
### Aliases: multitrait
### Keywords: datasets

### ** Examples

data(multitrait)					# Load dataset
multitrait <- fill.geno(multitrait)                     # impute missing genotype data
## Don't show: 
multitrait <- subset(multitrait, chr=1)
multitrait$pheno <- multitrait$pheno[,1:3]
## End(Don't show)
result <- mqmscanall(multitrait, logtransform=TRUE)	# Analyse all 24 traits



