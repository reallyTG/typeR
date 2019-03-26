library(SASmixed)


### Name: Weights
### Title: Data from a weight-lifting program
### Aliases: Weights
### Keywords: datasets

### ** Examples

str(Weights)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 3.1, p. 91
  print(fm1Weight <- lmer(strength ~ Program * Time + (1|Subj), Weights))
  print(anova(fm1Weight))
  print(fm2Weight <- lmer(strength ~ Program * Time + (Time|Subj), Weights))
  print(anova(fm1Weight, fm2Weight))
## Not run: 
##D intervals(fm2Weight)
##D fm3Weight <- update(fm2Weight, correlation = corAR1())
##D anova(fm2Weight, fm3Weight)
##D fm4Weight <- update(fm3Weight, strength ~ Program * (Time + I(Time^2)),
##D                     random = ~Time|Subj)
##D summary(fm4Weight)
##D anova(fm4Weight)
##D intervals(fm4Weight)
## End(Not run)
}



