library(VineCopula)


### Name: BiCopEst
### Title: Parameter Estimation for Bivariate Copula Data
### Aliases: BiCopEst

### ** Examples


## Example 1: bivariate Gaussian copula
dat <- BiCopSim(500, 1, 0.7)
u1 <- dat[, 1]
v1 <- dat[, 2]

# estimate parameters of Gaussian copula by inversion of Kendall's tau
est1.tau <- BiCopEst(u1, v1, family = 1, method = "itau")
est1.tau  # short overview
summary(est1.tau)  # comprehensive overview
str(est1.tau)  # see all contents of the object

# check if parameter actually coincides with inversion of Kendall's tau
tau1 <- cor(u1, v1, method = "kendall")
all.equal(BiCopTau2Par(1, tau1), est1.tau$par)

# maximum likelihood estimate for comparison
est1.mle <- BiCopEst(u1, v1, family = 1, method = "mle")
summary(est1.mle)


## Example 2: bivariate Clayton and survival Gumbel copulas
# simulate from a Clayton copula
dat <- BiCopSim(500, 3, 2.5)
u2 <- dat[, 1]
v2 <- dat[, 2]

# empirical Kendall's tau
tau2 <- cor(u2, v2, method = "kendall")

# inversion of empirical Kendall's tau for the Clayton copula
BiCopTau2Par(3, tau2)
BiCopEst(u2, v2, family = 3, method = "itau")

# inversion of empirical Kendall's tau for the survival Gumbel copula
BiCopTau2Par(14, tau2)
BiCopEst(u2, v2, family = 14, method = "itau")

# maximum likelihood estimates for comparison
BiCopEst(u2, v2, family = 3, method = "mle")
BiCopEst(u2, v2, family = 14, method = "mle")





