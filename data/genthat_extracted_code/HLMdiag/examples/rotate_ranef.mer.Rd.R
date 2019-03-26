library(HLMdiag)


### Name: rotate_ranef.default
### Title: Calculate s-dimensional rotated random effects
### Aliases: rotate_ranef rotate_ranef.default rotate_ranef.lme
###   rotate_ranef.lmerMod rotate_ranef.mer

### ** Examples

library(lme4)
fm <- lmer(log.radon ~ basement + uranium + (basement | county), data = radon)

ngrps <- summary(fm)$ngrps
L.b0  <- kronecker(Diagonal(ngrps), c(1, 0))
L.b1  <- kronecker(Diagonal(ngrps), c(0, 1))

b0.rot <- rotate_ranef(.mod = fm, .L = L.b0, s = 65, .varimax = TRUE)
qqnorm(b0.rot)

b1.rot <- rotate_ranef(.mod = fm, .L = L.b1, s = 65, .varimax = TRUE)
qqnorm(b1.rot)



