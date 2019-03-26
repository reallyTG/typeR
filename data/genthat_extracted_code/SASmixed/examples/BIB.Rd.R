library(SASmixed)


### Name: BIB
### Title: Data from a balanced incomplete block design
### Aliases: BIB
### Keywords: datasets

### ** Examples

str(BIB)
if (require("lattice", quietly = TRUE, character = TRUE)) {
  xyplot(y ~ x | Block, BIB, groups = Treatment, type = c("g", "p"),
         aspect = "xy", auto.key = list(points = TRUE, space = "right",
         lines = FALSE))
}
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with Output 5.7, p. 188
  print(fm1BIB <- lmer(y ~ Treatment * x + (1 | Block), BIB))
  print(anova(fm1BIB))     # strong evidence of different slopes
  ## compare with Output 5.9, p. 193
  print(fm2BIB <- lmer(y ~ Treatment + x : Grp + (1 | Block), BIB))
  print(anova(fm2BIB))
}



