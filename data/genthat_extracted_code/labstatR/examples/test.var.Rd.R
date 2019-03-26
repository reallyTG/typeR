library(labstatR)


### Name: test.var
### Title: Calcola intervallo di confidenza per la varianza
### Aliases: test.var
### Keywords: univar

### ** Examples

x <- rnorm(100, sd=5)
var(x)
test.var(x,20)
test.var(x,20,alternative="less")



