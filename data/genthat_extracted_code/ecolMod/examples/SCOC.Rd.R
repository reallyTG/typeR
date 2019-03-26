library(ecolMod)


### Name: SCOC
### Title: a Sediment Community Oxygen Consumption (SCOC) dataset
### Aliases: SCOC
### Keywords: datasets

### ** Examples

plot(SCOC[,1], SCOC[,2], log = "xy", xlab = "water depth, m",
     ylab = "", main = "SCOC, mmol O2/m2/d", pch = 16,
     xaxt = "n", yaxt = "n", cex.main = 1)

axis(1, at = c(0.5, 5, 50, 500, 5000), 
     labels = c("0.5", "5", "50", "500", "5000"))
axis(2, at = c(0.1, 1, 10, 100), 
     labels = c("0.1", "1", "10", "100"))

ll <- lm(log(SCOC[,2])~ log(SCOC[,1]))
rr <- summary(ll)$r.squared
A  <- exp(coef(ll)[1])
B  <- (coef(ll)[2])
curve(A*x^B, add = TRUE, lwd = 2)
AA <- round(A*100)/100
BB <- round(B*100)/100
expr <- substitute(y==A*x^B, list(A=AA,B=BB))
text(1, .1, expr, adj = 0)
expr2 <- substitute(r^2==rr, list(rr=round(rr*100)/100))
text(1, 0.04, expr2, adj = 0)


