library(DynTxRegime)


### Name: .newTxInfoWithSubsets
### Title: Create Treatment Information Object When Subsets are Identified
### Aliases: .newTxInfoWithSubsets
###   .newTxInfoWithSubsets,character,factor-method
###   .newTxInfoWithSubsets,character,integer-method
### Keywords: internal

### ** Examples


data(bmiData)
bmiData$A1 <- as.factor(bmiData$A1)
bmiData$A2 <- as.factor(bmiData$A2)
bmiData$A3 <- 0L
bmiData$A3[bmiData$A1 == "MR"] <- 1L

fSet1 <- function(data){
           subsets <- list(list("subset1",c(0L,1L)),
                           list("subset2",c(0L,1L)))
           txOpts <- character(nrow(data))
           txOpts[data$A1 == "CD"] <- "subset1"
           txOpts[data$A1 == "MR"] <- "subset2"
           return(list("subsets" = subsets, "txOpts" = txOpts))
         }

ptsSubset <- character(nrow(bmiData))
ptsSubset[bmiData$A1 == "CD"] <- "subset1"
ptsSubset[bmiData$A1 == "MR"] <- "subset2"

subsets <- list("subset1" = c(0,1),
                "subset2" = c(0,1))

tst <- DynTxRegime:::.newTxInfoWithSubsets(txName = "A3", 
                                           txVec = bmiData$A3, 
                                           fSet = fSet1,  
                                           subsets = subsets,  
                                           ptsSubset = ptsSubset)

is(tst)

# Factor treatment with subsetting
fSet2 <- function(data){
           subsets <- list(list("subset1", c("CD","MR")),
                           list("subset2", c("CD","MR")))
          txOpts <- character(nrow(data))
          txOpts[data$A1 == "CD"] <- "subset1"
          txOpts[data$A1 == "MR"] <- "subset2"
          return(list("subsets" = subsets, "txOpts" = txOpts))
         }


ptsSubset <- character(nrow(bmiData))
ptsSubset[bmiData$A1 == "CD"] <- "subset1"
ptsSubset[bmiData$A1 == "MR"] <- "subset2"

subsets <- list("subset1" = c("CD","MR"),
                "subset2" = c("CD","MR"))

tst <- DynTxRegime:::.newTxInfoWithSubsets(txName = "A2", 
                                           txVec = bmiData$A2, 
                                           fSet = fSet2,  
                                           subsets = subsets,  
                                           ptsSubset = ptsSubset)

is(tst)




