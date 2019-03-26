library(mosum)


### Name: multiscale.bottomUp
### Title: Multiscale MOSUM algorithm with bottom-up merging
### Aliases: multiscale.bottomUp

### ** Examples

x <- testData(lengths=c(50, 50, 200, 300, 300), means=c(0, 1, 2, 3, 2.3), sds=rep(1, 5))
G <- (5:20)*5
mbu <- multiscale.bottomUp(x, G=G, alpha=0.1)
summary(mbu)



