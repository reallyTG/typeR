library(VineCopula)


### Name: BiCopChiPlot
### Title: Chi-plot for Bivariate Copula Data
### Aliases: BiCopChiPlot

### ** Examples


## chi-plots for bivariate Gaussian copula data

# simulate copula data
fam <- 1
tau <- 0.5
par <- BiCopTau2Par(fam, tau)
cop <- BiCop(fam, par)
set.seed(123)
dat <- BiCopSim(500, cop)

# create chi-plots
op <- par(mfrow = c(1, 3))
BiCopChiPlot(dat[,1], dat[,2], xlim = c(-1,1), ylim = c(-1,1),
             main="General chi-plot")
BiCopChiPlot(dat[,1], dat[,2], mode = "lower", xlim = c(-1,1),
             ylim = c(-1,1), main = "Lower chi-plot")
BiCopChiPlot(dat[,1], dat[,2], mode = "upper", xlim = c(-1,1),
             ylim = c(-1,1), main = "Upper chi-plot")
par(op)




