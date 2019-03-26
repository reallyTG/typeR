## ---- fig.show='hold', dpi=110-------------------------------------------
library(cnbdistr)
D <- 11
r1 <- 4
r2 <- 0.8
theta <- 0.63 # this is p1/p2
x <- dcnb(0:D, D, r1, r2, theta)
plot(0:D, x, type='h', lwd=8, col = "palegreen3")
y <- dcnb(0:D, D, r2, r1, 1/theta)
plot(0:D, y, type='h', lwd=8, col = "royalblue3")

## ---- fig.show='hold', dpi=110-------------------------------------------
library(cnbdistr)
D <- 11
r1 <- 4
r2 <- 0.8
theta <- 0.63 # this is p1/p2
x <- pcnb(0:D, D, r1, r2, theta)
plot(0:D, x, type='s', lwd=4, col = "palegreen3")
y <- pcnb(0:D, D, r2, r1, 1/theta)
plot(0:D, y, type='s', lwd=4, col = "royalblue3")

## ---- fig.show='hold', dpi=110-------------------------------------------
library(cnbdistr)
D <- 11
r1 <- 4
r2 <- 0.8
theta <- 0.63 # this is p1/p2
x <- qcnb(seq(0, 1, 0.01), D, r1, r2, theta)
plot(seq(0, 1, 0.01), x, type='s', lwd=4, col = "palegreen3")
y <- qcnb(seq(0, 1, 0.01), D, r2, r1, 1/theta)
plot(seq(0, 1, 0.01), y, type='s', lwd=4, col = "royalblue3")

## ---- fig.show='hold', out.width='64%', dpi=300, fig.align='center'------
library(cnbdistr)
D <- 11
r1 <- 4
r2 <- 0.8
theta <- 0.63 # this is p1/p2
x <- rcnb(1e4, D, r1, r2, theta)
hist(x, seq(-0.5, 0.5 + D, by = 1), col = 'gray72')
table(x) / 1e4
format(dcnb(0:D, D, r1, r2, theta), digits=2)

## ---- fig.show='hold', dpi=110-------------------------------------------
library(cnbdistr)
D <- 11
r1 <- 4
r2 <- 0.8
theta <- 0.63 # this is p1/p2
mu_cnb(D, r1, r2, theta)
sum(c(0:D) * dcnb(0:D, D, r1, r2, theta))

## ---- fig.show='hold', dpi=110-------------------------------------------
library(cnbdistr)
D <- 11
r1 <- 4
r2 <- 0.8
theta <- 0.63 # this is p1/p2
sigma2_cnb(D, r1, r2, theta)
sum((c(0:D) - mu_cnb(D, r1, r2, theta))^2 * dcnb(0:D, D, r1, r2, theta))

