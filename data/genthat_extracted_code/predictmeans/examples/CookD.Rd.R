library(predictmeans)


### Name: CookD
### Title: Calculates and plots Cook's distances for a Linear (Mixed) Model
### Aliases: CookD

### ** Examples

library(predictmeans)
Oats$nitro <- factor(Oats$nitro)
fm <- lme(yield ~ nitro*Variety, random=~1|Block/Variety, data=Oats)
# library(lme4)
# fm <- lmer(yield ~ nitro*Variety+(1|Block/Variety), data=Oats)
CookD(fm)



