library(mmeln)


### Name: mmeln
### Title: mmeln : mixture of multivariate normal
### Aliases: mmeln
### Keywords: mmeln mixture normal multivariate

### ** Examples

data(exY)
### estimation of the parameters of the mixture
temps <- 0:2
mmeln1 <- mmeln(Y, G = 3,
                form.loc = list(~temps, ~temps + I(temps^2), ~temps + I(temps^2)),
                form.mel = ~SEXE, cov = "CS")



