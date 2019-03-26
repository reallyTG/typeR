library(psych)


### Name: bock
### Title: Bock and Liberman (1970) data set of 1000 observations of the
###   LSAT
### Aliases: bock bock.table lsat6 lsat7 bock.lsat
### Keywords: datasets

### ** Examples

data(bock)
responses <- table2df(bock.table[,2:6],count=bock.table[,7],
        labs= paste("lsat6.",1:5,sep=""))
describe(responses)
## maybe str(bock.table) ; plot(bock.table) ...



