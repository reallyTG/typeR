library(qCBA)


### Name: arulesCBAModel2CustomCBAModel
### Title: arulesCBAModel2CustomCBAModel Converts a model created by
###   'arulesCBA' so that it can be passed to qCBA
### Aliases: arulesCBAModel2CustomCBAModel

### ** Examples


## No test: 
if (! requireNamespace("arulesCBA", quietly = TRUE)) {
 message("Please install arulesCBA: install.packages('arulesCBA')")
}  else {
 message("The following code might cause the 'pruning exception' rCBA error on some installations")
 discrModel <- discrNumeric(iris, "Species")
 irisDisc <- as.data.frame(lapply(discrModel$Disc.data, as.factor))
 arulesCBAModel <- arulesCBA::CBA(Species ~ ., data = irisDisc, supp = 0.05, 
  conf=0.9, lhs.support=TRUE)
 cCBAmodel <- arulesCBAModel2CustomCBAModel(arulesCBAModel, discrModel$cutp, iris)
 qCBAmodel <- qcba(cbaRuleModel=cCBAmodel,datadf=iris)
 print(qCBAmodel@rules)
 }
## End(No test)




