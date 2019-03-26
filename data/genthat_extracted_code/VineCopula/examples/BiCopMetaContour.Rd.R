library(VineCopula)


### Name: BiCopMetaContour
### Title: Contour Plot of Bivariate Meta Distribution
### Aliases: BiCopMetaContour

### ** Examples

## meta Clayton distribution  with Gaussian margins
cop <- BiCop(family = 1, tau = 0.5)
BiCopMetaContour(obj = cop, main = "Clayton - normal margins")
# better:
contour(cop, main = "Clayton - normal margins")

## empirical contour plot with standard normal margins
dat <- BiCopSim(1000, cop)
BiCopMetaContour(dat[, 1], dat[, 2], bw = 2, family = "emp",
                 main = "empirical - normal margins")
# better:
BiCopKDE(dat[, 1], dat[, 2],
        main = "empirical - normal margins")

## empirical contour plot with exponential margins
BiCopMetaContour(dat[, 1], dat[, 2], bw = 2,
                 main = "empirical - exponential margins",
                 margins = "exp", margins.par = 1)
# better:
BiCopKDE(dat[, 1], dat[, 2],
         main = "empirical - exponential margins",
         margins = "exp")




