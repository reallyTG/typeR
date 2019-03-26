library(plotrix)


### Name: ladderplot
### Title: Ladder Plot
### Aliases: ladderplot ladderplot.default
### Keywords: aplot

### ** Examples

x<-data.frame(A=c(1:10), B=c(2:11)+rnorm(10))
y<-data.frame(x, C=c(1:10)+rnorm(10))
opar <- par(mfrow=c(1,3))
ladderplot(x)
ladderplot(x, col=1:10, vertical=FALSE)
ladderplot(y, col=1:10)
par(opar)

## examples from parcoord
## Not run: 
##D if (require(MASS)) {
##D opar <- par(mfrow=c(2,3))
##D z1 <- state.x77[, c(7, 4, 6, 2, 5, 3)]
##D parcoord(z1, main="parcoord state.x77")
##D ladderplot(z1, pch=NA, scale=TRUE, main="ladderplot state.x77 original")
##D ladderplot(z1, main="ladderplot state.x77 original")
##D ir <- rbind(iris3[,,1], iris3[,,2], iris3[,,3])
##D z2 <- log(ir)[, c(3, 4, 2, 1)]
##D parcoord(z2, col = 1 + (0:149))
##D ladderplot(z2, scale=TRUE, col = 1 + (0:149),
##D     main="ladderplot iris original")
##D ladderplot(z2, col = 1 + (0:149))
##D par(opar)
##D }
## End(Not run)



