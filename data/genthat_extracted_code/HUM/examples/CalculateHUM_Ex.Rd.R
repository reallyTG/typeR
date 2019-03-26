library(HUM)


### Name: CalculateHUM_Ex
### Title: Calculate HUM value
### Aliases: CalculateHUM_Ex
### Keywords: multivariate nonparametric plot roc auc

### ** Examples

data(sim)
# Basic example
indexF=c(3,4);
indexClass=2;
allLabel=c("Normal","OrthArthr","OA","Early")
amountL=2
out=CalculateHUM_Ex(sim,indexF,indexClass,allLabel,amountL)



