library(predictmeans)


### Name: PMplot
### Title: Level Plot of a Matrix of p-values.
### Aliases: PMplot
### Keywords: ~kwd1 ~kwd2

### ** Examples

  library(predictmeans)
  set.seed(2013)
  pvalues <- runif(28)
  pmatrix <- matrix(0,8,8)
  pmatrix[lower.tri(pmatrix)] <- pvalues
  round(pmatrix, 4)
  PMplot(pmatrix)

  Oats$nitro <- factor(Oats$nitro)
  fm <- lmer(yield ~ nitro*Variety+(1|Block/Variety), data=Oats)
  predictout <- predictmeans(fm, "nitro:Variety", atvar="Variety", adj="BH", barplot=TRUE)
  PMplot(predictout$p_valueMatrix)
  



