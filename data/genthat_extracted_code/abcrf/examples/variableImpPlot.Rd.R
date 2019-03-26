library(abcrf)


### Name: variableImpPlot
### Title: Variable importance plot from a random forest
### Aliases: variableImpPlot

### ** Examples

data(snp)
modindex <- snp$modindex[1:500]
sumsta <- snp$sumsta[1:500,]
data1 <- data.frame(modindex, sumsta)
model.rf <- abcrf(modindex~., data1, ntree=100)
variableImpPlot(model.rf)



