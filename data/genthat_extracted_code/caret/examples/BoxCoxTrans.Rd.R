library(caret)


### Name: BoxCoxTrans
### Title: Box-Cox and Exponential Transformations
### Aliases: BoxCoxTrans BoxCoxTrans.default predict.BoxCoxTrans
###   expoTrans.default expoTrans predict.expoTrans print.BoxCoxTrans
### Keywords: utilities

### ** Examples

data(BloodBrain)

ratio <- exp(logBBB)
bc <- BoxCoxTrans(ratio)
bc

predict(bc, ratio[1:5])

ratio[5] <- NA
bc2 <- BoxCoxTrans(ratio, bbbDescr$tpsa, na.rm = TRUE)
bc2

manly <- expoTrans(ratio)
manly




