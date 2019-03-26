library(ecolMod)


### Name: Zoogrowth
### Title: a zooplankton growth dataset
### Aliases: Zoogrowth
### Keywords: datasets

### ** Examples

ii <- which(Zoogrowth[ ,2]>0)
plot(Zoogrowth[ii, 1], Zoogrowth[ii, 2], log = "xy",
     xlab = "zooplankton volume, micrometer ^ 3", ylab = "" ,
     main = "maximal growth rate, /hr", pch = 16, cex.main = 1)

ll <- lm(log(Zoogrowth[ii,2])~ log(Zoogrowth[ii,1]))
rr <- summary(ll)$r.squared
A  <- exp(coef(ll)[1])
B  <- (coef(ll)[2])
curve(A*x^B, add = TRUE, lwd = 2)
AA <- round(A*100)/100
BB <- round(B*100)/100
expr <- substitute(y==A*x^B, list(A=AA,B=BB))
text(100, .0035, expr, adj = 0)
expr2 <- substitute(r^2==rr, list(rr=round(rr*100)/100))
text(100, 0.002, expr2, adj = 0)


