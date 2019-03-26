library(Bolstad2)


### Name: hierMeanReg
### Title: Hierarchical Normal Means Regression Model
### Aliases: hierMeanReg

### ** Examples

priorTau <- list(tau0 = 0, v0 = 1000)
priorPsi <- list(psi0 = 500, eta0 = 1)
priorVar <- list(s0 = 500, kappa0 = 1)
priorBeta <- list(b0 = c(0,0), bMat = matrix(c(1000,100,100,1000), nc = 2))

data(hiermeanRegTest.df)
data.df <- hiermeanRegTest.df
design <- list(y = data.df$y, group = data.df$group,
               x = as.matrix(data.df[,3:4]))
r<-hierMeanReg(design, priorTau, priorPsi, priorVar, priorBeta)

oldPar <- par(mfrow = c(3,3))
plot(density(r$tau))
plot(density(r$psi))
plot(density(r$mu.1))
plot(density(r$mu.2))
plot(density(r$mu.3))
plot(density(r$beta.1))
plot(density(r$beta.2))
plot(density(r$sigmaSq))
par(oldPar)

## example with no covariates
priorTau <- list(tau0 = 0, v0 = 1000)
priorPsi <- list(psi0 = 500, eta0 = 1)
priorVar <- list(s0 = 500, kappa0 = 1)

data(hiermeanRegTest.df)
data.df <- hiermeanRegTest.df
design <- list(y = data.df$y, group = data.df$group, x = NULL)
r<-hierMeanReg(design, priorTau, priorPsi, priorVar)

oldPar <- par(mfrow = c(3,2))
plot(density(r$tau))
plot(density(r$psi))
plot(density(r$mu.1))
plot(density(r$mu.2))
plot(density(r$mu.3))
plot(density(r$sigmaSq))
par(oldPar)




