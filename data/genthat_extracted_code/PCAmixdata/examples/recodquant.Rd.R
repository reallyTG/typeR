library(PCAmixdata)


### Name: recodquant
### Title: Recoding of the quantitative data matrix
### Aliases: recodquant

### ** Examples

data(decathlon)
X <- decathlon[1:5,1:5]
X[1,2] <- NA
X[2,3] <-NA
rec <- recodquant(X)



