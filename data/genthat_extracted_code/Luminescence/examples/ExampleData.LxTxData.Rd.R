library(Luminescence)


### Name: ExampleData.LxTxData
### Title: Example Lx/Tx data from CW-OSL SAR measurement
### Aliases: ExampleData.LxTxData

### ** Examples


## plot Lx/Tx data vs dose [s]
data(ExampleData.LxTxData, envir = environment())
plot(LxTxData$Dose,LxTxData$LxTx)




