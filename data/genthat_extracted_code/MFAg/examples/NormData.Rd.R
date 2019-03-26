library(MFAg)


### Name: NormData
### Title: Normalizes the data
### Aliases: NormData
### Keywords: Normalizes the data

### ** Examples

data(DataQuan) # set of quantitative data

Dat <- DataQuan[,2:8]

Resp = NormData(Dat, Type = 1) # normalizes the data globally

Resp # data globally normalized

sd(Resp)   # global standard deviation

mean(Resp) # mean global


Resp = NormData(Dat, Type = 2) # normalizes the data by column

Resp # Data normalized by column

apply(Resp, 2, sd) # standard deviation for column

colMeans(Resp)     # mean of columns



