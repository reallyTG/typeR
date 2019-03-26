library(CalibrateSSB)


### Name: MatchVarNames
### Title: MatchVarNames
### Aliases: MatchVarNames
### Keywords: internal

### ** Examples

z <- data.frame(A = factor(c("a", "b", "c")), B = factor(1:2), C = 1:6)
x <- colnames(model.matrix(~B * C * A, z))
y <- colnames(model.matrix(~A * B + A:B:C, z))
MatchVarNames(x, y)



