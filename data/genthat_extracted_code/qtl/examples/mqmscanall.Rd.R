library(qtl)


### Name: mqmscanall
### Title: Parallelized MQM on multiple phenotypes in a cross object
### Aliases: mqmscanall
### Keywords: models

### ** Examples

#Doing a multitrait analysis
data(multitrait)
## Don't show: 
multitrait <- subset(multitrait, chr=1:2, ind=!apply(multitrait$pheno, 1, function(a) any(is.na(a))))
multitrait$pheno <- multitrait$pheno[,1:3]
## End(Don't show)
multitrait <- calc.genoprob(multitrait)
cof <- mqmsetcofactors(multitrait,3)
multitrait <- fill.geno(multitrait)
result <- mqmscanall(multitrait,cofactors=cof,batchsize=5)
mqmplot.multitrait(result,"lines")



