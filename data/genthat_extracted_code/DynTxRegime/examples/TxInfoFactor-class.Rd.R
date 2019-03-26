library(DynTxRegime)


### Name: TxInfoFactor-class
### Title: Class '"TxInfoFactor"'
### Aliases: TxInfoFactor-class
### Keywords: internal

### ** Examples

showClass("TxInfoFactor")

obj <- new("TxInfoFactor", superSet = c("A","B"), txName = "A1")

txVec1 <- as.factor(c("A","B","A","B"))
txVec2 <- as.factor(c("A","B","A","A"))

DynTxRegime:::.compare(object = obj, vec1 = txVec1, vec2 = txVec2)

DynTxRegime:::.convertTx(object = obj, txVec = c("A","B","A","B"))

DynTxRegime:::.getLevels(object = obj, txVec = txVec1)

DynTxRegime:::.getSuperSet(object = obj)

DynTxRegime:::.getTxName(object = obj)

DynTxRegime:::.validTx(object = obj, txVec = c("A","B"))

try(DynTxRegime:::.validTx(object = obj, txVec = c("A","C")))




