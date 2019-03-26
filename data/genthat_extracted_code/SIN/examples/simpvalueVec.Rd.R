library(SIN)


### Name: simpvalueVec
### Title: Simultaneous p-values
### Aliases: simpvalueVec
### Keywords: internal

### ** Examples

data(fowlbones)
temp <- -solve(fowlbones$corr)
diag(temp) <- abs(diag(temp))
temp <- cov2cor(temp)
p <- dim(temp)[1]
round( simpvalueVec(temp[1,2:p],fowlbones$n,p), 2)



