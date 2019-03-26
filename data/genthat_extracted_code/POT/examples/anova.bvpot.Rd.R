library(POT)


### Name: anova.bvpot
### Title: Anova Tables: Bivariate Case
### Aliases: anova.bvpot
### Keywords: models

### ** Examples

x <- rgpd(1000, 0, 1, -0.25)
y <- rgpd(1000, 2, 0.5, 0)
M0 <- fitbvgpd(cbind(x,y), c(0, 2))
M1 <- fitbvgpd(cbind(x,y), c(0,2), model = "alog")
anova(M0, M1)

##Non regular case
M0 <- fitbvgpd(cbind(x,y), c(0, 2))
M1 <- fitbvgpd(cbind(x,y), c(0, 2), alpha = 1)
anova(M0, M1, half = TRUE)



