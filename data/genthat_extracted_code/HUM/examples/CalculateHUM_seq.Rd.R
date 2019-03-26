library(HUM)


### Name: CalculateHUM_seq
### Title: Calculate HUM value
### Aliases: CalculateHUM_seq
### Keywords: multivariate nonparametric plot roc auc

### ** Examples

data(sim)
# Basic example
indexF=names(sim[,c(3,4)])
indexClass=2
label=unique(sim[,indexClass])
indexLabel=label[1:3]
out=CalculateHUM_seq(sim,indexF,indexClass,indexLabel)



