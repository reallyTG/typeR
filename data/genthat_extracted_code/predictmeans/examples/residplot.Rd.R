library(predictmeans)


### Name: residplot
### Title: Diagnostic Plots for a Linear (Mixed) Model
### Aliases: residplot

### ** Examples

## Note that the order of levels of nested random effects is oposite 
## between lme and lmer objects.

library(predictmeans)
Oats$nitro <- factor(Oats$nitro)
fm <- lme(yield ~ nitro*Variety, random=~1|Block/Variety, data=Oats)
residplot(fm, level=2)    #lme: level=2 for random effect "Block:Variety"

#  Not Run
#  library(lme4)
#  fm <- lmer(yield ~ nitro*Variety+(1|Block/Variety), data=Oats)
#  residplot(fm) # lmer: By default level=1 for random effect "Block:Variety"



