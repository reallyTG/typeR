library(SASmixed)


### Name: SIMS
### Title: Second International Mathematics Study data
### Aliases: SIMS
### Keywords: datasets

### ** Examples

str(SIMS)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare to output 7.4, p. 262
  print(fm1SIMS <- lmer(Gain ~ Pretot + (Pretot | Class), data = SIMS))
  print(anova(fm1SIMS))
}



