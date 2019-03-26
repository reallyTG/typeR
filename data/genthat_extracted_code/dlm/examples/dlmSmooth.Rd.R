library(dlm)


### Name: dlmSmooth
### Title: DLM smoothing
### Aliases: dlmSmooth dlmSmooth.dlmFiltered dlmSmooth.default
### Keywords: ts smooth misc

### ** Examples

s <- dlmSmooth(Nile, dlmModPoly(1, dV = 15100, dW = 1470))
plot(Nile, type ='o')
lines(dropFirst(s$s), col = "red")

## Multivariate
set.seed(2)
tmp <- dlmRandom(3, 5, 20)
obs <- tmp$y
m <- tmp$mod
rm(tmp)

f <- dlmFilter(obs, m)
s <- dlmSmooth(f)
all.equal(s, dlmSmooth(obs, m))



