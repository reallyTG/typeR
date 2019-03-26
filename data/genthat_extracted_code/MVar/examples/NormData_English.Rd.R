library(MVar)


### Name: NormData
### Title: Normalizes the data.
### Aliases: NormData
### Keywords: Normalizes the data.

### ** Examples

data(DataQuan) # set of quantitative data

Data <- DataQuan[,2:8]

Resp = NormData(Data, Type = 1) # normalizes the data globally

Resp # Globally standardized data

sd(Resp)   # overall standard deviation

mean(Resp) # overall mean


Resp = NormData(Data, Type = 2) # normalizes the data per column

Resp # standardized data per column

apply(Resp, 2, sd) # standard deviation per column

colMeans(Resp)     # column averages



