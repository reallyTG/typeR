library(gencve)


### Name: SinghTest
### Title: Singh Prostate Microarray Test Data
### Aliases: SinghTest
### Keywords: datasets

### ** Examples

require("MASS")
data(SinghTest)
BestGenes <- 10
XTr <- SinghTrain[,1:BestGenes]
yTr <- SinghTrain$health
ans <- lda(x=XTr, grouping=yTr)
XTe <- SinghTest[,1:BestGenes]
yH <- predict(ans, newdata=XTe)$class
yTe <- SinghTest$health
table(yTe, yH)



