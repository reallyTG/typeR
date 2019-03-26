library(SASmixed)


### Name: Genetics
### Title: Heritability data
### Aliases: Genetics
### Keywords: datasets

### ** Examples

str(Genetics)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  summary(fm1Gen <- lmer(Yield ~ Family + (1|Location/Block), Genetics))
}



