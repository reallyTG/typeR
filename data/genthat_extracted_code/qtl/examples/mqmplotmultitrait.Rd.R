library(qtl)


### Name: mqmplot.multitrait
### Title: Plot the results from a genomescan using a multiple-QTL model on
###   multiple phenotypes
### Aliases: mqmplot.multitrait
### Keywords: hplot

### ** Examples

data(multitrait)
## Don't show: 
multitrait <- subset(multitrait, chr=1:2, ind=!apply(multitrait$pheno, 1, function(a) any(is.na(a))))
multitrait$pheno <- multitrait$pheno[,1:3]
## End(Don't show)
multitrait <- fill.geno(multitrait) # impute missing genotype data
result <- mqmscanall(multitrait, logtransform=TRUE)
mqmplot.multitrait(result,"lines")
mqmplot.multitrait(result,"contour")
mqmplot.multitrait(result,"image")
mqmplot.multitrait(result,"3Dplot")



