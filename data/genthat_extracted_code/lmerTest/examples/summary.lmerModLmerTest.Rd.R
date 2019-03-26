library(lmerTest)


### Name: summary.lmerModLmerTest
### Title: Summary Method for Linear Mixed Models
### Aliases: summary.lmerModLmerTest

### ** Examples


# Fit example model:
data("sleepstudy", package="lme4")
fm <- lmer(Reaction ~ Days + (1|Subject) + (0+Days|Subject), sleepstudy)

# Get model summary:
summary(fm) # Satterthwaite df and t-tests

# Extract coefficient table:
coef(summary(fm))

# Use the Kenward-Roger method
if(requireNamespace("pbkrtest", quietly = TRUE))
  summary(fm, ddf="Kenward-Roger")

# The lme4-summary table:
summary(fm, ddf="lme4") # same as summary(as(fm, "lmerMod"))

## Don't show: 
  # Check that summaries are as expected:
  summ_fm <- coef(summary(fm))
  summ_fm_lme4 <- coef(summary(fm, ddf="lme4"))
  stopifnot(
    all(colnames(summ_fm) == c("Estimate", "Std. Error", "df", "t value", "Pr(>|t|)")),
    all(colnames(summ_fm_lme4) == c("Estimate", "Std. Error", "t value")),
    all(!(is.na(summ_fm))),
    all(!(is.na(summ_fm_lme4)))
  )
 if(requireNamespace("pbkrtest", quietly = TRUE) && getRversion() >= "3.3.3") {
    summ_fm_kr <- coef(summary(fm, ddf="Kenward-Roger"))
     stopifnot(
       all(colnames(summ_fm_kr) == c("Estimate", "Std. Error", "df", "t value", "Pr(>|t|)")),
       all(!(is.na(summ_fm_kr)))
    )
 }
## End(Don't show)



