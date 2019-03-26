library(qtl)


### Name: groupclusteredheatmap
### Title: Retrieving groups of traits after clustering
### Aliases: groupclusteredheatmap
### Keywords: utilities

### ** Examples

data(multitrait)
## Don't show: 
multitrait <- subset(multitrait, chr=1:2, ind=!apply(multitrait$pheno, 1, function(a) any(is.na(a))))
multitrait$pheno <- multitrait$pheno[,1:3]
## End(Don't show)
multitrait <- fill.geno(multitrait) # impute missing genotype data
result <- mqmscanall(multitrait, logtransform=TRUE)
cresults <- mqmplot.clusteredheatmap(multitrait,result)
groupclusteredheatmap(multitrait,cresults,10)



