library(multcomp)


### Name: waste
### Title: Industrial Waste Data Set
### Aliases: waste
### Keywords: datasets

### ** Examples


  ### set up two-way ANOVA with interactions
  amod <- aov(waste ~ temp * envir, data=waste)

  ### comparisons of main effects only
  K <- glht(amod, linfct = mcp(temp = "Tukey"))$linfct
  K
  glht(amod, K)

  ### comparisons of means (by averaging interaction effects)
  low <- grep("low:envi", colnames(K))
  med <- grep("medium:envi", colnames(K))
  K[1, low] <- 1 / (length(low) + 1)
  K[2, med] <- 1 / (length(low) + 1)
  K[3, med] <- 1 / (length(low) + 1)
  K[3, low] <- - 1 / (length(low) + 1)
  K
  confint(glht(amod, K))

  ### same as TukeyHSD
  TukeyHSD(amod, "temp")

  ### set up linear hypotheses for all-pairs of both factors
  wht <- glht(amod, linfct = mcp(temp = "Tukey", envir = "Tukey"))

  ### cf. Westfall et al. (1999, page 181)
  summary(wht, test = adjusted("Shaffer"))




