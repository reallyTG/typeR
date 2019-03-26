library(VineCopula)


### Name: BiCopKPlot
### Title: Kendall's Plot for Bivariate Copula Data
### Aliases: BiCopKPlot

### ** Examples


## Gaussian and Clayton copulas
n <- 500
tau <- 0.5

# simulate from Gaussian copula
fam <- 1
par <- BiCopTau2Par(fam, tau)
cop1 <- BiCop(fam, par)
set.seed(123)
dat1 <- BiCopSim(n, cop1)

# simulate from Clayton copula
fam <- 3
par <- BiCopTau2Par(fam, tau)
cop2 <- BiCop(fam, par)
set.seed(123)
dat2 <- BiCopSim(n, cop2)

# create K-plots
op <- par(mfrow = c(1, 2))
BiCopKPlot(dat1[,1], dat1[,2], main = "Gaussian copula")
BiCopKPlot(dat2[,1], dat2[,2], main = "Clayton copula")
par(op)




