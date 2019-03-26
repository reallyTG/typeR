library(SASmixed)


### Name: Bond
### Title: Strengths of metal bonds
### Aliases: Bond
### Keywords: datasets

### ** Examples

str(Bond)
options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
if (require("lme4", quietly = TRUE, character = TRUE)) {
  ## compare with output 1.1 on p. 6
  print(fm1Bond <- lmer(pressure ~ Metal + (1|Ingot), Bond))
  print(anova(fm1Bond))
}



