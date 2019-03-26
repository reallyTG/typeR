library(SASmixed)


### Name: Semiconductor
### Title: Semiconductor split-plot experiment
### Aliases: Semiconductor
### Keywords: datasets

### ** Examples

str(Semiconductor)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  print(fm1Semi <- lmer(resistance ~ ET * position + (1|Grp), Semiconductor))
  print(anova(fm1Semi))
  print((fm2Semi <- lmer(resistance ~ ET + position + (1|Grp), Semiconductor)))
  print(anova(fm2Semi))
}



