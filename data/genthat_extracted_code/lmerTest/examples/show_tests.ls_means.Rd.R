library(lmerTest)


### Name: show_tests.ls_means
### Title: Show LS-means Hypothesis Tests and Contrasts
### Aliases: show_tests.ls_means

### ** Examples


data("cake", package="lme4")
model <- lmer(angle ~ recipe * temp + (1|recipe:replicate), cake)

# LS-means:
(lsm <- ls_means(model))

# Contrasts for LS-means estimates and hypothesis tests:
show_tests(lsm)




