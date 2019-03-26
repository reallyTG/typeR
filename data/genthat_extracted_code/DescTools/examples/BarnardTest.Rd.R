library(DescTools)


### Name: BarnardTest
### Title: Barnard's Unconditional Test
### Aliases: BarnardTest
### Keywords: nonparametric htest

### ** Examples

tab <- as.table(matrix(c(8, 14, 1, 3), nrow=2,
                dimnames=list(treat=c("I","II"), out=c("I","II"))))
BarnardTest(tab)

# Plotting the search for the nuisance parameter for a one-sided test
bt <- BarnardTest(tab)
plot(bt$nuisance.matrix[, 1:2],
     t="l", xlab="nuisance parameter", ylab="p-value")

# Plotting the tables included in the p-value
ttab <- as.table(matrix(c(40, 14, 10, 30), nrow=2,
                 dimnames=list(treat=c("I","II"), out=c("I","II"))))

bt <- BarnardTest(ttab)
bts <- bt$statistic.table
plot(bts[, 1], bts[, 2],
     col=hsv(bts[, 4] / 4, 1, 1),
     t="p", xlab="n1", ylab="n2")

# Plotting the difference between pooled and unpooled tests
bts <- BarnardTest(ttab, pooled=TRUE)$statistic.table
btw <- BarnardTest(ttab, pooled=FALSE)$statistic.table
plot(bts[, 1], bts[, 2],
     col=c("black", "white")[1 + as.numeric(bts[, 4]==btw[, 4])],
     t="p", xlab="n1", ylab="n2")



