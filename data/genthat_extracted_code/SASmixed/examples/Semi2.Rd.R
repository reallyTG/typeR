library(SASmixed)


### Name: Semi2
### Title: Oxide layer thicknesses on semiconductors
### Aliases: Semi2
### Keywords: datasets

### ** Examples

str(Semi2)
xtabs(~Lot + Wafer, Semi2)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
  ## compare with output 4.13, p. 156
  print(fm1Semi2 <- lmer(Thickness ~ 1 + (1|Lot/Wafer), Semi2))
  ## compare with output 4.15, p. 159
  print(fm2Semi2 <- lmer(Thickness ~ Source + (1|Lot/Wafer), Semi2))
  print(anova(fm2Semi2))
  ## compare with output 4.17, p. 163
  print(fm3Semi2 <- lmer(Thickness ~ Source + (1|Lot/Wafer) + (1|Lot:Source),
                         Semi2))
  ## This is not the same as the SAS model.
}



