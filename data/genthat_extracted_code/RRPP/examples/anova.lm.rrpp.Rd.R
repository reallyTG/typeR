library(RRPP)


### Name: anova.lm.rrpp
### Title: ANOVA for lm.rrpp model fits
### Aliases: anova.lm.rrpp
### Keywords: utilities

### ** Examples

# See examples for lm.rrpp to see how anova.lm.rrpp works in conjunction
# with other functions

data(Pupfish)
names(Pupfish)
Pupfish$logSize <- log(Pupfish$CS) # better to not have functions in formulas

# Single-Model ANOVA
fit <- lm.rrpp(coords ~ logSize + Sex*Pop, SS.type = "I", data = Pupfish) 
anova(fit)
anova(fit, effect.type = "MS")
anova(fit, effect.type = "Rsq")
anova(fit, effect.type = "cohenf")

# Multi-Model ANOVA (like a Likelihood Ratio Test)
fit.size <- lm.rrpp(coords ~ logSize, SS.type = "I", data = Pupfish) 
fit.sex <- lm.rrpp(coords ~ logSize + Sex, SS.type = "I", data = Pupfish) 
fit.pop <- lm.rrpp(coords ~ logSize + Pop, SS.type = "I", data = Pupfish) 
anova(fit.size, fit.sex, fit.pop) # compares two models to the first

# see lm.rrpp examples for mixed model ANOVA example and how to vary SS type




