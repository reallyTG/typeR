library(MVar)


### Name: CoefVar
### Title: Coefficient of variation of the data.
### Aliases: CoefVar
### Keywords: Coefficient of variation CoefVar

### ** Examples

data(DataQuan) # data set

Data <- DataQuan[,2:8]

Resp <- CoefVar(Data, Type = 1) # Coefficient of overall variation
round(Resp,2)

Resp <- CoefVar(Data, Type = 2) # Coefficient of variation per column
round(Resp,2)



