library(DynTxRegime)


### Name: TxInfoFactorWithSubsets-class
### Title: Class '"TxInfoFactorWithSubsets"'
### Aliases: TxInfoFactorWithSubsets-class
### Keywords: internal

### ** Examples

showClass("TxInfoFactorWithSubsets")

fSet <- function(x1){
          subsets <- list("subset1" = c("A","B"),
                          "subset2" = c("A"))

          ptsSubset <- character(length(x1))
          ptsSubset[x1 > 0] <- "subset1"
          ptsSubset[x1 <= 0] <- "subset2"
}

obj <- new("TxInfoFactorWithSubsets",
           superSet = c("A","B"),
           txName = "A1",
           ptsSubset = c("subset1", "subset2", "subset1", "subset2"),
           subsetRule = fSet,
           subsets = list("subset1" = c("A","B"),
                          "subset2" = c("A")),
           singleton = c(FALSE,TRUE,FALSE,TRUE))

txVec1 <- as.factor(c("A","B","A","B"))
txVec2 <- as.factor(c("A","A","A","B"))

DynTxRegime:::.compare(object = obj, vec1 = txVec1, vec2 = txVec2)

DynTxRegime:::.convertTx(object = obj, txVec = c("A","B","A"))

DynTxRegime:::.getLevels(object = obj, txVec = txVec1)

DynTxRegime:::.getSuperSet(object = obj)

DynTxRegime:::.getTxName(object = obj)

DynTxRegime:::.getPtsSubset(object = obj)

DynTxRegime:::.getSingleton(object = obj)

DynTxRegime:::.getSubsetRule(object = obj)

DynTxRegime:::.getSubsets(object = obj)

DynTxRegime:::.validTx(object = obj, c("B","A","A","A"))

try(DynTxRegime:::.validTx(object = obj, c("B","B","A","A")))




