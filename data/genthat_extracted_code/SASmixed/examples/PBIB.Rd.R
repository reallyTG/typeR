library(SASmixed)


### Name: PBIB
### Title: A partially balanced incomplete block experiment
### Aliases: PBIB
### Keywords: datasets

### ** Examples

str(PBIB)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 1.7  pp. 24-25
  print(fm1PBIB <- lmer(response ~ Treatment + (1|Block), PBIB))
  print(anova(fm1PBIB))
}



