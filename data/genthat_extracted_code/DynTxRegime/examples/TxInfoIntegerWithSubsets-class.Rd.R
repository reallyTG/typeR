library(DynTxRegime)


### Name: TxInfoIntegerWithSubsets-class
### Title: Class '"TxInfoIntegerWithSubsets"'
### Aliases: TxInfoIntegerWithSubsets-class
### Keywords: internal

### ** Examples

showClass("TxInfoIntegerWithSubsets")

fSet <- function(x1){
          subsets <- list("subset1" = c(0L,1L),
                          "subset2" = c(0L))

          ptsSubset <- character(length(x1))
          ptsSubset[x1 > 0] <- "subset1"
          ptsSubset[x1 <= 0] <- "subset2"
}

obj <- new("TxInfoIntegerWithSubsets",
           superSet = c(0L,1L),
           txName = "A1",
           ptsSubset = c("subset1", "subset2", "subset1", "subset2"),
           subsetRule = fSet,
           subsets = list("subset1" = c(0L,1L),
                          "subset2" = c(0L)),
           singleton = c(FALSE,TRUE,FALSE,TRUE))

txVec1 <- c(0L,1L,0L,1L)
txVec2 <- c(0L,0L,0L,1L)

DynTxRegime:::.compare(object = obj, vec1 = txVec1, vec2 = txVec2)

DynTxRegime:::.convertTx(object = obj, txVec = c(0L,1L,0L))

DynTxRegime:::.getLevels(object = obj, txVec = txVec1)

DynTxRegime:::.getSuperSet(object = obj)

DynTxRegime:::.getTxName(object = obj)

DynTxRegime:::.getPtsSubset(object = obj)

DynTxRegime:::.getSingleton(obj)

DynTxRegime:::.getSubsetRule(obj)

DynTxRegime:::.getSubsets(obj)

DynTxRegime:::.validTx(obj, c(1L,0L,0L,0L))

try(DynTxRegime:::.validTx(obj, c(0L,0L,2L,1L)))




