library(predictmeans)


### Name: predictmeans
### Title: Predicted Means of a Linear Model
### Aliases: predictmeans

### ** Examples

  library(predictmeans)
  ftable(xtabs(yield ~ Block+Variety+nitro, data=Oats))
  Oats$nitro <- factor(Oats$nitro)
  fm <- lme(yield ~ nitro*Variety, random=~1|Block/Variety, data=Oats)
# library(lme4)
# fm <- lmer(yield ~ nitro*Variety+(1|Block/Variety), data=Oats)
  predictmeans(fm, "nitro", adj="BH")
  predictmeans(fm, "nitro:Variety", atvar="Variety", adj="BH")
  predictout <- predictmeans(fm, "nitro:Variety", atvar="Variety", adj="BH", barplot=TRUE)
  names(predictout)
  print(predictout$predictmeansPlot)
  print(predictout$predictmeansBarPlot)



