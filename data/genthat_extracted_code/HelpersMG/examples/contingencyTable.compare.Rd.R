library(HelpersMG)


### Name: contingencyTable.compare
### Title: Contingency table comparison using Akaike weight
### Aliases: contingencyTable.compare

### ** Examples

## Not run: 
##D library("HelpersMG")
##D 
##D # Symmetry of Lepidochelys olivacea scutes
##D table <- t(data.frame(SriLanka=c(200, 157), AfricaAtl=c(19, 12), 
##D                       Guyana=c(8, 6), Suriname=c(162, 88), 
##D                       MexicoPac1984=c(42, 34), MexicoPac2014Dead=c(8, 9),
##D                       MexicoPac2014Alive=c(13, 12), 
##D                       row.names =c("Symmetric", "Asymmetric")))
##D table
##D contingencyTable.compare(table)
##D 
##D table <- t(data.frame(SriLanka=c(200, 157), AfricaAtl=c(19, 12), Guyana=c(8, 6),
##D                       Suriname=c(162, 88), MexicoPac1984=c(42, 34), 
##D                       MexicoPac2014Dead=c(8, 9),
##D                       MexicoPac2014Alive=c(13, 12), Lepidochelys.kempii=c(99, 1), 
##D                       row.names =c("Symmetric", "Asymmetric")))
##D table
##D contingencyTable.compare(table)
##D 
##D # Conformity to a model
##D table <- matrix(c(33, 12, 25, 75), ncol = 2, byrow = TRUE)
##D probs <- c(0.5, 0.5)
##D contingencyTable.compare(table, probs=probs)
##D 
##D # Conformity to a model
##D table <- matrix(c(33, 12), ncol = 2, byrow = TRUE)
##D probs <- c(0.5, 0.5)
##D contingencyTable.compare(table, probs=probs)
##D 
##D # Conformity to a model
##D table <- matrix(c(33, 12, 8, 25, 75, 9), ncol = 3, byrow = TRUE)
##D probs <- c(0.8, 0.1, 0.1)
##D contingencyTable.compare(table, probs=probs)
##D 
##D # Comparison of chisq.test() and this function
##D table <- matrix(c(NA, NA, 25, 75), ncol = 2, byrow = TRUE)
##D 
##D pv <- NULL
##D aw <- NULL
##D par(new=FALSE)
##D n <- 100
##D 
##D for (GroupA in 0:n) {
##D   table[1, 1] <- GroupA
##D   table[1, 2] <- n-GroupA
##D   pv <- c(pv, chisq.test(table)$p.value)
##D   aw <- c(aw, contingencyTable.compare(table, criterion="BIC")[1])
##D }
##D 
##D x <- 0:n
##D y <- pv
##D y2 <- aw
##D plot(x=x, y=y, type="l", bty="n", las=1, xlab="Number of type P in Group B", ylab="Probability", 
##D      main="", lwd=2)
##D lines(x=x, y=y2, type="l", col="red", lwd=2)
##D 
##D # w-value
##D (l1 <- x[which(aw>0.05)[1]])
##D (l2 <- rev(x)[which(rev(aw)>0.05)[1]])
##D 
##D aw[l1]
##D pv[l1]
##D 
##D aw[l2+2]
##D pv[l2+2]
##D 
##D # p-value
##D l1 <- which(pv>0.05)[1]
##D l2 <- max(which(pv>0.05))
##D 
##D aw[l1]
##D pv[l1]
##D 
##D aw[l2]
##D pv[l2]
##D 
##D y[which(y2>0.05)[1]]
##D y[which(rev(y2)>0.05)[1]]
##D 
##D par(xpd=TRUE)
##D text(x=25, y=1.15, labels="Group A: 25 type P / 100", pos=1)
##D 
##D segments(x0=25, y0=0, x1=25, y1=1, lty=3)
##D 
##D # plot(1, 1)
##D 
##D v1 <- c(expression(italic("p")*"-value"), expression("after "*chi^2*"-test"))
##D v2 <- c(expression(italic("w")*"-value for A"), expression("and B identical models"))
##D legend("topright", legend=c(v1, v2), 
##D        y.intersp = 1, 
##D        col=c("black", "black", "red", "red"), bty="n", lty=c(1, 0, 1, 0))
##D 
##D segments(x0=0, x1=n, y0=0.05, y1=0.05, lty=2)
##D text(x=101, y=0.05, labels = "0.05", pos=4)
## End(Not run)



