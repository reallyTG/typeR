library(codadiags)


### Name: bridgestat.diag
### Title: Iterative truncation procedure based on a bridge statistic.
### Aliases: bridgestat.diag

### ** Examples

require(codadiags)
set.seed(123)
x = AR1()
print(bridgestat.diag(x))
y = add.transient(x)
print(bridgestat.diag(y,trunc=10))



