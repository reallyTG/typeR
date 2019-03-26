library(MPV)


### Name: GRegplot
### Title: Graphical Regression Plot
### Aliases: GRegplot
### Keywords: graphics

### ** Examples

# Example 1
X <- p4.18[,-4]
y <- p4.18[,4]
GRegplot(X, y, includeIntercept=FALSE)
title("Evidence of Regression in the Jojoba Oil Data")
# Example 2
set.seed(4571)
Z <- matrix(rnorm(400), ncol=10)
A <- matrix(rnorm(81), ncol=9)
simdata <- data.frame(Z[,1], crossprod(t(Z[,-1]),A))
names(simdata) <- c("y", paste("x", 1:9, sep=""))
GRegplot(simdata[,-1], simdata[,1], includeIntercept=FALSE)
title("Evidence of Regression in Simulated Data Set")
# Example 3
GRegplot(table.b1[,-1], table.b1[,1], includeIntercept=FALSE)
title("Evidence of Regression in NFL Data Set")
# An example where stepwise AIC selects the complement
# of the set of variables that are actually in the true model:
X <- pathoeg[,-10]
y <- pathoeg[,10]
par(mfrow=c(2,1))
GRegplot(X, y)
GRegplot(X, y, sortTrt=TRUE)
X <- table.b1[,-1]  # NFL data
y <- table.b1[,1]
GRegplot(X, y)



