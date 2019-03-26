library(predictmeans)


### Name: anovalmer
### Title: ANOVA of a Linear Mixed Effects Model produced by l'lmer'
###   function
### Aliases: anovalmer

### ** Examples

## Not run for simplifying process of submiting pkg to CRAN
library(predictmeans)
Oats$nitro <- factor(Oats$nitro) 
fm <- lmer(yield ~ nitro*Variety+(1|Block/Variety), data=Oats)
anovalmer(fm)



