## ----setup, echo=TRUE----------------------------------------------------
library(MittagLeffleR)
tail <- 0.7
scale <- 2
n <- 1000
cutoff <- 2 * scale

## ---- echo=TRUE, warning=FALSE-------------------------------------------
r <- rml(n = n, tail = tail, scale=scale)
edfun <- ecdf(r)
x <- seq(0.01,10,0.01)
plot(x,edfun(x), xlim=c(0,10), type='l', main = "CDF on linear scale", 
     ylab="p", xlab="x")
y <- pml(q = x, tail = tail, scale=scale)
lines(x,y,col=2)
z <- 1-exp(-(x/scale)^tail)
lines(x,z, lty=2)


x <- exp(seq(-10,10,0.01))
y <- 1-edfun(x)
plot(x,y, type='l', log='xy', main = "Tail Function on log-scale", 
     xlab = "x", ylab = "p")
y <- pml(q = x, tail = tail, scale=scale, lower.tail = FALSE)
lines(x,y, col=2)
# power law for large values
z <- x^(-tail)
lines(x,z, lty=2)
# stretched exponential for small values
w <- exp(-(x/scale)^tail)
lines(x,w, lty=2)

## ---- echo=TRUE----------------------------------------------------------
cutoff <- 10
fac <- sum(r <= cutoff) / n
r <- r[r <= cutoff]
hist(r, freq = FALSE, breaks = 50)
x <- seq(0.01,cutoff,0.01)
y <- dml(x = x, tail = tail, scale=scale) / fac
lines(x,y, col=2)

## ---- echo=TRUE, warning=FALSE-------------------------------------------
library(MittagLeffleR)
n <- 10^5
tail <- 0.6
r <- rml(n = n, tail = tail, scale=scale, second.type = TRUE)
edfun <- ecdf(r)
plot(edfun, xlim=c(0,cutoff))
x <- seq(0.01,cutoff,0.01)
y <- pml(q = x, tail = tail, scale=scale, second.type = TRUE)
lines(x,y, col=2)

x <- exp(seq(-10,4,0.01))
y <- 1-edfun(x)
plot(x,y, type='l', log='xy', main = "Tail Function on log-scale", 
     xlab = "x", ylab = "p")
y <- pml(q = x, tail = tail, scale=scale, lower.tail = FALSE, second.type = TRUE)
lines(x,y, col=2)
# exponential distribution
w <- exp(-(x/scale))
lines(x,w, lty=2)

## ---- warning=FALSE, echo=TRUE-------------------------------------------
hist(r, freq = FALSE, breaks = 20)
x <- seq(0.01,cutoff,0.01)
y <- dml(x = x, tail = tail, scale=scale, second.type = TRUE)
lines(x,y, col=2)

