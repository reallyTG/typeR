library(SASmixed)


### Name: Cultivation
### Title: Bacterial innoculation applied to grass cultivars
### Aliases: Cultivation
### Keywords: datasets

### ** Examples

str(Cultivation)
xtabs(~Block+Cult, Cultivation)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with Output 2.10, page 58
  print(fm1Cult <- lmer(drywt ~ Inoc * Cult + (1|Block) + (1|Cult),
                          Cultivation))
  print(anova(fm1Cult))
  print(fm2Cult <- lmer(drywt ~ Inoc + Cult + (1|Block) + (1|Cult),
                          Cultivation))
  print(anova(fm2Cult))
  print(fm3Cult <- lmer(drywt ~ Inoc + (1|Block) + (1|Cult), Cultivation))
  print(anova(fm3Cult))
}



