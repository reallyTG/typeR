library(curveDepth)


### Name: depthc.Tukey
### Title: Calculate Tukey curve depth for curves
### Aliases: depthc.Tukey

### ** Examples

library(curveDepth)
# Load digits and transform them to curves
data("mnistShort017")
n <- 10 # cardinality of each class
m <- 50 # number of points to sample
cst <- 1/10 # a threshold constant
alp <- 1/8 # a threshold constant
curves0 <- images2curves(mnistShort017$`0`[, , 1:n])
curves1 <- images2curves(mnistShort017$`1`[, , 1:n])
# Calculate depths
depthSpace = matrix(NA, nrow = n * 2, ncol = 2)
set.seed(1)
depthSpace[, 1] = depthc.Tukey(
  c(curves0, curves1), curves0, m = m,
  exactEst = TRUE, minMassObj = cst/m^alp)
depthSpace[, 2] = depthc.Tukey(
  c(curves0, curves1), curves1, m = m,
  exactEst = TRUE, minMassObj = cst/m^alp)
# Draw the DD-plot
plot(NULL, xlim = c(0, 1), ylim = c(0, 1),
     xlab = paste("Depth w.r.t. '0'"),
     ylab = paste("Depth w.r.t. '1'"),
     main = paste("DD-plot for '0' vs '1'"))
grid()
# Draw the separating rule
dat1 <- data.frame(cbind(
  depthSpace, c(rep(0, n), rep(1, n))))
ddalpha1 <- ddalpha.train(X3 ~ X1 + X2, data = dat1,
                          depth = "ddplot",
                          separator = "alpha")
ddnormal <- ddalpha1$classifiers[[1]]$hyperplane[2:3]
pts <- matrix(c(0, 0, 1, ddnormal[1] / -ddnormal[2]),
              nrow = 2, byrow = TRUE)
lines(pts, lwd = 2)
# Draw the points
points(depthSpace[1:n, ],
       col = "red", lwd = 2, pch = 1)
points(depthSpace[(n + 1):(2 * n), ],
       col = "blue", lwd = 2, pch = 3)



