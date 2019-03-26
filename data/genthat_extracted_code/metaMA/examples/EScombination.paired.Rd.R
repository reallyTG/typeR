library(metaMA)


### Name: EScombination.paired
### Title: Effect size combination for paired data
### Aliases: EScombination.paired
### Keywords: methods models

### ** Examples

data(Singhdata)
#create artificially paired data:
artificialdata=lapply(Singhdata$esets,FUN=function(x) (x[,1:10]-x[,11:20]))
#Meta-analysis
res=EScombination.paired(artificialdata)
#Number of differentially expressed genes in the meta-analysis
length(res$Meta)
#To plot an histogram of raw p-values
rawpval=2*(1-pnorm(abs(res$TestStatistic)))
hist(rawpval,nclass=100)



