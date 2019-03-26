library(jtools)


### Name: summ.merMod
### Title: Mixed effects regression summaries with options
### Aliases: summ.merMod j_summ.merMod

### ** Examples

if (requireNamespace("lme4")) {
  library(lme4, quietly = TRUE)
  data(sleepstudy)
  mv <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

  summ(mv) # Note lack of p values if you don't have lmerTest/pbkrtest

  # Without lmerTest/pbkrtest, you'll get message about Type 1 errors
  summ(mv, pvals = TRUE)

  # To suppress message, manually specify t.df argument
  summ(mv, t.df = "residual")

  # Confidence intervals may be better alternative to p values
  summ(mv, confint = TRUE)
  # Use conf.method to get profile intervals (may be slow to run)
  # summ(mv, confint = TRUE, conf.method = "profile")

}




