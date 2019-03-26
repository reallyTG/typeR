library(POT)


### Name: anova.uvpot
### Title: Anova Tables: Univariate Case
### Aliases: anova.uvpot
### Keywords: models

### ** Examples

x <- rgpd(1000, 0, 1, -0.15)
M0 <- fitgpd(x, 0, shape = -0.15)
M1 <- fitgpd(x, 0)
anova(M0, M1) 



