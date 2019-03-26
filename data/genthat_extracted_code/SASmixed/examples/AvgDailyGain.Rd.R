library(SASmixed)


### Name: AvgDailyGain
### Title: Average daily weight gain of steers on different diets
### Aliases: AvgDailyGain
### Keywords: datasets

### ** Examples

str(AvgDailyGain)
if (require("lattice", quietly = TRUE, character = TRUE)) {
  ## plot of adg versus Treatment by Block
  xyplot(adg ~ Treatment | Block, AvgDailyGain, type = c("g", "p", "r"),
         xlab = "Treatment (amount of feed additive)",
         ylab = "Average daily weight gain (lb.)", aspect = "xy",
         index.cond = function(x, y) coef(lm(y ~ x))[1])
}
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 5.1, p. 178
  print(fm1Adg <- lmer(adg ~ InitWt * Treatment - 1 + (1 | Block),
                         AvgDailyGain))
  print(anova(fm1Adg))   # checking significance of terms
  print(fm2Adg <- lmer(adg ~ InitWt + Treatment + (1 | Block),
                         AvgDailyGain))
  print(anova(fm2Adg))
  print(lmer(adg ~ InitWt + Treatment - 1 + (1 | Block), AvgDailyGain))
}



