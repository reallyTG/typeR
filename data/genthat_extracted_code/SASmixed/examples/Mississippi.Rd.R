library(SASmixed)


### Name: Mississippi
### Title: Nitrogen concentrations in the Mississippi River
### Aliases: Mississippi
### Keywords: datasets

### ** Examples

str(Mississippi)
if (require("lattice", quietly = TRUE, character = TRUE)) {
  dotplot(drop(influent:Type) ~ y, groups = Type, Mississippi)
} 
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 4.1, p. 142
  print(fm1Miss <- lmer(y ~ 1 + (1|influent), Mississippi))
  ## compare with output 4.2, p. 143
  print(fm1MLMiss <- update(fm1Miss, REML=FALSE))
  ## BLUP's of random effects on p. 142
  ranef(fm1Miss)            
  ## BLUP's of random effects on p. 144
  print(ranef(fm1MLMiss))
#intervals(fm1Miss)       # interval estimates of variance components
  ## compare to output 4.8 and 4.9, pp. 150-152
  print(fm2Miss <- lmer(y ~ Type+(1|influent), Mississippi, REML=TRUE))
  print(anova(fm2Miss))
}



