library(DynTxRegime)


### Name: TxInfoInteger-class
### Title: Class '"TxInfoInteger"'
### Aliases: TxInfoInteger-class
### Keywords: internal

### ** Examples

showClass("TxInfoInteger")

obj <- new("TxInfoInteger", superSet = c(0L,1L), txName = "A1")

txVec1 <- c(0L,1L,0L,1L)
txVec2 <- c(0L,1L,0L,0L)

DynTxRegime:::.compare(object = obj, vec1 = txVec1, vec2 = txVec2)

DynTxRegime:::.convertTx(object = obj, txVec = c(0,1,0,1))

DynTxRegime:::.getLevels(object = obj, txVec = txVec1)

DynTxRegime:::.getSuperSet(object = obj)

DynTxRegime:::.getTxName(object = obj)

DynTxRegime:::.validTx(object = obj, txVec = c(0L,1L))

try(DynTxRegime:::.validTx(object = obj, txVec = c(0L,2L)))



