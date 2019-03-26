library(DAAGxtras)


### Name: MaskedPriming
### Title: Masked Repetition Priming Data
### Aliases: MaskedPriming
### Keywords: datasets

### ** Examples

data(MaskedPriming)
str(MaskedPriming)
plot(MaskedPriming[sample(6381,100), 7:10])
## Not run: 
##D library(lme4)
##D cmat <- matrix(c(-1,  1,  0,
##D 	             -1, -1,  2),  3,  2, 
##D 	             dimnames=list(c("BM1", "BM2", "SK"), 
##D 	                              c(".BM1-2", ".BM-SK")))
##D m0 <- lmer(rrt ~ p*f*e + (1 | subjects) + (0 + p | subjects) +
##D            (0 + f | subjects) + (1 | words), contrasts=list(e=cmat),
##D            data=d)
##D m1p <- lmer(rrt ~ p*f*e + (p | subjects) + (0+f | subjects) + (1 | words), 
##D                  contrasts=list(e=cmat)
##D m2 <- lmer(rrt ~ p*f*e + (p + f | subjects) + (1 | words), 
##D                  contrasts=list(e=cmat), data=d)
##D anova(m0, m1p, m2)
## End(Not run)



