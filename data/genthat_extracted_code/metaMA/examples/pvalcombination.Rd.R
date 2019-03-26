library(metaMA)


### Name: pvalcombination
### Title: P-value combination for unpaired data
### Aliases: pvalcombination
### Keywords: methods models

### ** Examples

data(Singhdata)
#Meta-analysis
res=pvalcombination(esets=Singhdata$esets,classes=Singhdata$classes)
#Number of differentially expressed genes in the meta-analysis
length(res$Meta)
#To plot an histogram of raw p-values
rawpval=2*(1-pnorm(abs(res$TestStatistic)))
hist(rawpval,nclass=100)



