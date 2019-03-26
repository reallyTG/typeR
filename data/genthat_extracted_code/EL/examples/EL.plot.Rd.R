library(EL)


### Name: EL.plot
### Title: Draws plots using the smoothed two-sample empirical likelihood
###   method
### Aliases: EL.plot
### Keywords: ~nonparametric ~smooth ~hplot

### ** Examples

## The examples showcase all available graphs

X1 <- rchisq(100, 2.5)
X2 <- rnorm(100, 0, 1)

p <- par(lwd=2, mfrow=c(3,2))

# Intro
xlim <- c(min(X1, X2) - 0.5, max(X1, X2) + 0.5)
D1 <- density(X1)
D2 <- density(X2)
ylim <- c(min(D1$y, D2$y), max(D1$y, D2$y))
plot(D1, xlim=xlim, ylim=ylim, main="Distribution functions", xlab="x")
lines(D2, lty="dashed")
legend("topright", c(eval(substitute(expression(paste("X1 (bw = ", a, ")")), 
                                     list(a = round(D1$bw, 2)))),
                     eval(substitute(expression(paste("X2 (bw = ", a, ")")), 
                                     list(a = round(D2$bw, 2))))),
                   lty=c("solid", "dashed"))

# CDF differences
EL.plot("fdiff", X1, X2, main="F difference", conf.level=0.95)
tt <- seq(max(c(min(X1), min(X2))), min(c(max(X1), max(X2))), length=30)
ee <- ecdf(X2)(tt) - ecdf(X1)(tt)
points(tt, ee)

# Quantile differences
EL.plot("qdiff", X1, X2, main="Quantile difference", conf.level = 0.95)
tt <- seq(0.01, 0.99, length=30)
ee <- quantile(X2, tt) - quantile(X1, tt)
points(tt, ee)

# Q-Q plot
EL.plot("qq", X1, X2, main="Q-Q plot", conf.level=0.95)
tt <- seq(min(X2), max(X2), length=30)
ee <- quantile(X1, ecdf(X2)(tt))
points(tt, ee)

# P-P plot
EL.plot("pp", X1, X2, main="P-P plot", conf.level=0.95, ylim=c(0,1))
tt <- seq(0.01, 0.99, length=30)
ee <- ecdf(X1)(quantile(X2, tt))
points(tt, ee)


# ROC curve
EL.plot("roc", X1, X2, main="ROC curve", conf.level=0.95, ylim=c(0,1))
tt <- seq(0.01, 0.99, length=30)
ee <- 1- ecdf(X1)(quantile(X2, 1-tt))
points(tt, ee)

par(p)




