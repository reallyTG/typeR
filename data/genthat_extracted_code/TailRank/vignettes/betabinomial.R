### R code from vignette source 'betabinomial.Rnw'

###################################################
### code chunk number 1: lib
###################################################
library(TailRank)


###################################################
### code chunk number 2: compare
###################################################
N <- 20
u <- 3
v <- 10
p <- u/(u+v)
x <- 0:N
y <- dbinom(x, N, p)
yy <- dbb(x, N, u, v)



###################################################
### code chunk number 3: betabinomial.Rnw:58-60
###################################################
barplot(t(matrix(c(y, yy), ncol=2)), beside=TRUE, col=c("blue", "red"))
legend("topright", c("Binomial", "Beta-Binomial"), col=c("blue", "red"), pch=15)


###################################################
### code chunk number 4: betabinomial.Rnw:64-73
###################################################
set.seed(561662)
r <- rbinom(1000, N, p)
rr <- rbb(1000, N, u, v)
mean(r)
mean(rr)
var(r)
var(rr)
sd(r)
sd(rr)


