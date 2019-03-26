library(metaMA)


### Name: EScombination
### Title: Effect size combination for unpaired data
### Aliases: EScombination
### Keywords: methods models

### ** Examples

data(Singhdata)
#Meta-analysis
res=EScombination(esets=Singhdata$esets,classes=Singhdata$classes)
#Number of differentially expressed genes in the meta-analysis
length(res$Meta)
#To plot an histogram of raw p-values
rawpval=2*(1-pnorm(abs(res$TestStatistic)))
hist(rawpval,nclass=100)



