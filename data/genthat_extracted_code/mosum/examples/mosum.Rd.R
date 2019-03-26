library(mosum)


### Name: mosum
### Title: MOSUM procedure for change-point estimation
### Aliases: mosum

### ** Examples

x <- testData(lengths=rep(100, 3), means=c(0, 5, -2), sds=rep(1, 3))
m <- mosum(x, G=40)
plot(m)
summary(m)



