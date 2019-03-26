library(evd)


### Name: fpot
### Title: Peaks Over Threshold Modelling using the Generalized Pareto or
###   Point Process Representation
### Aliases: fpot print.pot
### Keywords: models

### ** Examples

uvdata <- rgpd(100, loc = 0, scale = 1.1, shape = 0.2)
M1 <- fpot(uvdata, 1)
M2 <- fpot(uvdata, 1, shape = 0)
anova(M1, M2)
par(mfrow = c(2,2))
plot(M1)
## Not run: M1P <- profile(M1)
## Not run: plot(M1P)

M1 <- fpot(uvdata, 1, mper = 10)
M2 <- fpot(uvdata, 1, mper = 100)
## Not run: M1P <- profile(M1, which = "rlevel", conf=0.975, mesh=0.1)
## Not run: M2P <- profile(M2, which = "rlevel", conf=0.975, mesh=0.1)
## Not run: plot(M1P)
## Not run: plot(M2P)



