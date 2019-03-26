library(copula)


### Name: rF01FrankJoe
### Title: Sample Univariate Distributions Involved in Nested Frank and Joe
###   Copulas
### Aliases: rF01Frank rF01Joe
### Keywords: distribution

### ** Examples

## Sample n random variates V0 ~ F0 for Frank and Joe with parameter
## chosen such that Kendall's tau equals 0.2 and plot histogram
n <- 1000
theta0.F <- copFrank@iTau(0.2)
V0.F <- copFrank@V0(n,theta0.F)
hist(log(V0.F), prob=TRUE); lines(density(log(V0.F)), col=2, lwd=2)
theta0.J <- copJoe@iTau(0.2)
V0.J <- copJoe@V0(n,theta0.J)
hist(log(V0.J), prob=TRUE); lines(density(log(V0.J)), col=2, lwd=2)

## Sample corresponding V01 ~ F01 for Frank and Joe and plot histogram
## copFrank@V01 calls rF01Frank(V0, theta0, theta1, rej=1, approx=10000)
## copJoe@V01 calls rF01Joe(V0, alpha, approx=10000)
theta1.F <- copFrank@iTau(0.5)
V01.F <- copFrank@V01(V0.F,theta0.F,theta1.F)
hist(log(V01.F), prob=TRUE); lines(density(log(V01.F)), col=2, lwd=2)
theta1.J <- copJoe@iTau(0.5)
V01.J <- copJoe@V01(V0.J,theta0.J,theta1.J)
hist(log(V01.J), prob=TRUE); lines(density(log(V01.J)), col=2, lwd=2)



