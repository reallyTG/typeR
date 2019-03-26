library(qCBA)


### Name: qcba
### Title: qCBA Quantitative CBA
### Aliases: qcba

### ** Examples

allData <- datasets::iris[sample(nrow(datasets::iris)),]
trainFold <- allData[1:100,]
testFold <- allData[101:nrow(datasets::iris),]
rmCBA <- cba(trainFold, classAtt="Species")
rmqCBA <- qcba(cbaRuleModel=rmCBA,datadf=trainFold)
print(rmqCBA@rules)



