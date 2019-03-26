library(DescTools)


### Name: CorPolychor
### Title: Polychoric Correlation
### Aliases: CorPolychor print.CorPolychor
### Keywords: models

### ** Examples

set.seed(12345)
z <- RndPairs(1000, 0.6)
x <- z[,1]
y <- z[,2]

cor(x, y)                                  # sample correlation
x <- cut(x, c(-Inf, .75, Inf))
y <- cut(y, c(-Inf, -1, .5, 1.5, Inf))

CorPolychor(x, y)                          # 2-step estimate
CorPolychor(x, y, ML=TRUE, std.err=TRUE)   # ML estimate



