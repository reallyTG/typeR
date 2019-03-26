library(lmerTest)


### Name: anova.lmerModLmerTest
### Title: ANOVA Tables for Linear Mixed Models
### Aliases: anova.lmerModLmerTest

### ** Examples


data("sleepstudy", package="lme4")
m <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
anova(m) # with p-values from F-tests using Satterthwaite's denominator df
anova(m, ddf="lme4") # no p-values

# Use the Kenward-Roger method
if(requireNamespace("pbkrtest", quietly = TRUE))
  summary(m, ddf="Kenward-Roger")

## Don't show: 
  an1 <- anova(m) # with p-values from F-tests using Satterthwaite's denominator df
  an2 <- anova(m, ddf="lme4")
  stopifnot(
    all(colnames(an1) == c("Sum Sq", "Mean Sq", "NumDF", "DenDF", "F value", "Pr(>F)")),
    !"Pr(>F)" %in% colnames(an2),
    all(!is.na(an1)),
    all(!is.na(an2))
  )
## End(Don't show)



