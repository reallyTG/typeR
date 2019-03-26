library(comf)


### Name: dfISO7933AppF
### Title: Adjusted data from Appendix F of ISO 7933
### Aliases: dfISO7933AppF
### Keywords: datasets

### ** Examples

data(dfISO7933AppF)
head(dfISO7933AppF)

dfHs <- sapply(seq(nrow(dfISO7933AppF)), function(x) { calcIso7933(dfISO7933AppF$accl[x], 
dfISO7933AppF$posture[x], dfISO7933AppF$Ta[x], dfISO7933AppF$Pa[x], dfISO7933AppF$Tr[x],
dfISO7933AppF$Va[x], dfISO7933AppF$Met[x], dfISO7933AppF$Icl[x], dfISO7933AppF$THETA[x], 
dfISO7933AppF$Walksp[x], dfISO7933AppF$Duration[x]) } ) 




