library(HelpersMG)


### Name: series.compare
### Title: Data series comparison using Akaike weight
### Aliases: series.compare

### ** Examples

## Not run: 
##D library("HelpersMG")
##D A <- rnorm(100, 10, 2)
##D B <- rnorm(100, 11.1, 2)
##D series.compare(A, B, criterion = "BIC", var.equal=TRUE)
##D B <- B[1:10]
##D series.compare(A, B, criterion = "BIC", var.equal=TRUE)
##D A <- rnorm(100, 10, 2)
##D B <- rnorm(100, 10.1, 2)
##D C <- rnorm(100, 10.5, 2)
##D series.compare(A, B, C, criterion = "BIC", var.equal=TRUE)
##D B <- B[1:10]
##D series.compare(A, B, criterion = "BIC", var.equal=TRUE)
##D t.test(A, B, var.equal=TRUE)
##D # Example with a data.frame
##D series.compare(t(data.frame(A=c(10, 27, 19, 20, NA), B=c(10, 20, NA, NA, NA))))
##D # Test in the context of big data
##D A <- rnorm(10000, 10, 2)
##D B <- rnorm(10000, 10.1, 2)
##D series.compare(A, B, criterion = "BIC", var.equal=TRUE)
##D t.test(A, B, var.equal=TRUE)
##D ###########################
##D w <- NULL
##D p <- NULL
##D 
##D for (i in 1:1000) {
##D   
##D   A <- rnorm(50000, 10, 2)
##D   B <- rnorm(50000, 10.01, 2)
##D   w <- c(w, unname(series.compare(A, B, criterion = "BIC", var.equal=TRUE)[1]))
##D   p <- c(p, t.test(A, B, var.equal=TRUE)$p.value)
##D 
##D }
##D 
##D layout(mat = 1:2)
##D par(mar=c(4, 4, 1, 1)+0.4)
##D hist(p, main="", xlim=c(0, 1), las=1, breaks = (0:20)/20, 
##D      freq=FALSE, xlab = expression(italic("p")*"-value"))
##D hist(w, main="", xlim=c(0, 1), las=1, breaks = (0:20)/20, 
##D     freq=FALSE, xlab = expression(italic("w")*"-value"))
##D ###########################
##D 
##D x <- seq(from=8, to=13, by=0.1)
##D 
##D pv <- NULL
##D aw <- NULL
##D A <- rnorm(100, mean=10, sd=2)
##D B <- A-2
##D 
##D for (meanB in x) {
##D   pv <- c(pv, t.test(A, B, var.equal = FALSE)$p.value)
##D   aw <- c(aw, series.compare(A, B, criterion="BIC", var.equal = FALSE)[1])
##D   B <- B + 0.1
##D }
##D 
##D par(mar=c(4, 4, 2, 1)+0.4)
##D y <- pv
##D plot(x=x, y=y, type="l", lwd=2,
##D      bty="n", las=1, xlab="Mean B value (SD = 4)", ylab="Probability", ylim=c(0,1), 
##D      main="")
##D y2 <- aw
##D lines(x=x, y=y2, type="l", col="red", lwd=2)
##D 
##D l1 <- which(aw>0.05)[1]
##D l2 <- max(which(aw>0.05))
##D 
##D aw[l1]
##D pv[l1]
##D 
##D aw[l2]
##D pv[l2]
##D 
##D l1 <- which(pv>0.05)[1]
##D l2 <- max(which(pv>0.05))
##D 
##D aw[l1]
##D pv[l1]
##D 
##D aw[l2]
##D pv[l2]
##D 
##D par(xpd=TRUE)
##D segments(x0=10-1.96*2/10, x1=10+1.96*2/10, y0=1.1, y1=1.1, lwd=2)
##D segments(x0=10, x1=10, y0=1.15, y1=1.05, lwd=2)
##D par(xpd=TRUE)
##D text(x=10.5, y=1.1, labels = "Mean A = 10, SD = 2", pos=4)
##D 
##D v1 <- c(expression(italic("p")*"-value"), expression("based on "*italic("t")*"-test"))
##D v2 <- c(expression(italic("w")*"-value for A"), expression("and B identical models"))
##D legend("topright", legend=c(v1, v2), 
##D        y.intersp = 1, 
##D        col=c("black", "black", "red", "red"), bty="n", lty=c(1, 0, 1, 0))
##D 
##D segments(x0=min(x), x1=max(x), y0=0.05, y1=0.05, lty=2)
##D par(xpd = TRUE)
##D text(x=13.05, y=0.05, labels = "0.05", pos=4)
## End(Not run)



