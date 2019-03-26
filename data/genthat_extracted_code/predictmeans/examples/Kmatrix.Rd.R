library(predictmeans)


### Name: Kmatrix
### Title: Matrix of Coefficients in a Linear Model
### Aliases: Kmatrix

### ** Examples

  library(predictmeans)
# library(lme4)
# fm <- lmer(yield ~ nitro*Variety+(1|Block/Variety), data=Oats)
  fm <- lme(yield ~ nitro*Variety, random=~1|Block/Variety, data=Oats)
  Kmatrix(fm, "Variety", prtnum=TRUE)
  Kmatrix(fm, "Variety", 0.5, prtnum=TRUE)
#  Kmatrix(fm, "Variety", "nitro")



