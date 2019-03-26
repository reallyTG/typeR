library(LICORS)


### Name: search_knn
### Title: K nearest neighbor (KNN) search
### Aliases: search_knn
### Keywords: classif cluster nonparametric

### ** Examples

set.seed(1984)
XX <- matrix(rnorm(40), ncol = 2)
YY <- matrix(runif(length(XX) * 2), ncol = ncol(XX))
knns_of_XX_in_XX <- search_knn(XX, 1)
knns_of_YY_in_XX <- search_knn(XX, 1, query = YY)
plot(rbind(XX, YY), type = "n", xlab = "", ylab = "")
points(XX, pch = 19, cex = 2, xlab = "", ylab = "")
arrows(XX[, 1], XX[, 2], XX[knns_of_XX_in_XX, 1], XX[knns_of_XX_in_XX, 2], lwd = 2)
points(YY, pch = 15, col = 2)
arrows(YY[, 1], YY[, 2], XX[knns_of_YY_in_XX, 1], XX[knns_of_YY_in_XX, 2], col = 2)
legend("left", c("X", "Y"), lty = 1, pch = c(19, 15), cex = c(2, 1), col = c(1, 2))



