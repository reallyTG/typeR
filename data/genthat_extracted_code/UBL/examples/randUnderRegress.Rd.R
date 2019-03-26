library(UBL)


### Name: RandUnderRegress
### Title: Random under-sampling for imbalanced regression problems
### Aliases: RandUnderRegress
### Keywords: pre-processing regression

### ** Examples


data(morley)

C.perc = list(0.5)
myUnd <- RandUnderRegress(Speed~., morley, C.perc=C.perc)
Bal <- RandUnderRegress(Speed~., morley, C.perc= "balance")
Ext <- RandUnderRegress(Speed~., morley, C.perc= "extreme")




