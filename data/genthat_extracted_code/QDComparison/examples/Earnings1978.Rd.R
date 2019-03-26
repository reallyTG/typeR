library(QDComparison)


### Name: Earnings1978
### Title: LaLonde's 1978 Earnings Data
### Aliases: Earnings1978
### Keywords: datasets

### ** Examples

data(Earnings1978)
## maybe str(Earnings1978)
y <- Earnings1978[,2]
x <- Earnings1978[,1]
hist(y[x==1])



