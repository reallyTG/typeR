library(VineCopula)


### Name: BiCopSelect
### Title: Selection and Maximum Likelihood Estimation of Bivariate Copula
###   Families
### Aliases: BiCopSelect

### ** Examples

## Example 1: Gaussian copula with large dependence parameter
par <- 0.7
fam <- 1
dat1 <- BiCopSim(500, fam, par)
# select the bivariate copula family and estimate the parameter(s)
cop1 <- BiCopSelect(dat1[, 1], dat1[, 2], familyset = 1:10,
                    indeptest = FALSE, level = 0.05)
cop1  # short overview
summary(cop1)  # comprehensive overview
str(cop1)  # see all contents of the object

## Example 2: Gaussian copula with small dependence parameter
par <- 0.01
fam <- 1
dat2 <- BiCopSim(500, fam, par)
# select the bivariate copula family and estimate the parameter(s)
cop2 <- BiCopSelect(dat2[, 1], dat2[, 2], familyset = 0:10,
                    indeptest = TRUE, level = 0.05)
summary(cop2)

## Example 3: empirical data
data(daxreturns)
cop3 <- BiCopSelect(daxreturns[, 1], daxreturns[, 4], familyset = 0:10)
summary(cop3)




