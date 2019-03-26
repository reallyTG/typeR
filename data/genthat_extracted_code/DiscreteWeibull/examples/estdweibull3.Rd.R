library(DiscreteWeibull)


### Name: estdweibull3
### Title: Estimation of parameters
### Aliases: estdweibull3
### Keywords: htest distribution

### ** Examples

# Ex1
x <- c(0,0,0,0,0,1,1,1,1,1,1,1,2,2,2,2,3,3,4,6)
estdweibull3(x, "P")
estdweibull3(x, "ML")
estdweibull3(x, "M")
# Ex 2
n <- 20
c <- 1/3
beta <- 2/3
x <- rdweibull3(n, c, beta)
estdweibull3(x, "P")
par <- estdweibull3(x, "ML")
par
-loglikedw3(par, x)
par <- estdweibull3(x, "M")
par
lossdw3(par, x)
n <- 50
x <- rdweibull3(n, c, beta)
estdweibull3(x, "P")
estdweibull3(x, "ML")
estdweibull3(x, "M")
n <- 100
x <- rdweibull3(n, c, beta)
estdweibull3(x, "P")
estdweibull3(x, "ML")
estdweibull3(x, "M")
# Ex 3: a piece of simulation study
nSim <- 50
n <- 50
c <- 0.2
beta <- 0.7
par <- matrix(0, nSim, 2)
for(i in 1:nSim)
{
x <- rdweibull3(n, c, beta)
par[i,] <- estdweibull3(x, "ML")
}
op <- par(mfrow = c(1,2))
boxplot(par[,1], xlab=expression(hat(c)[ML]))
abline(h = c)
boxplot(par[,2], xlab=expression(hat(beta)[ML]))
abline(h = beta)
op <- par()



