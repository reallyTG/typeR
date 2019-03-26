library(qtl)


### Name: mqmplot.clusteredheatmap
### Title: Plot clustered heatmap of MQM scan on multiple phenotypes
### Aliases: mqmplot.clusteredheatmap
### Keywords: hplot

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



