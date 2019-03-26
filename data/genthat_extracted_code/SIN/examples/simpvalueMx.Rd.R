library(SIN)


### Name: simpvalueMx
### Title: Simultaneous p-values
### Aliases: simpvalueMx
### Keywords: internal

### ** Examples

data(fowlbones)
temp <- -solve(fowlbones$corr)
diag(temp) <- abs(diag(temp))
temp <- cov2cor(temp)
p <- dim(temp)[1]
round( simpvalueMx(temp,fowlbones$n,p), 2)



