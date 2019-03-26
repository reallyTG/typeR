library(DandEFA)


### Name: factload
### Title: R-mode Exploratory Factor Analysis
### Aliases: factload
### Keywords: Dandelion plot Exploratory Factor Analysis

### ** Examples

data(timss2011)
timss2011 <- na.omit(timss2011)
factload(timss2011,nfac=5,method="prax",cormeth="spearman")
factload(timss2011,nfac=8,method="pc",cormeth="pearson",rotation="promax")
timsscor <- cor(timss2011)
factload(data.cor=timsscor,nfac=10,method="mle")



