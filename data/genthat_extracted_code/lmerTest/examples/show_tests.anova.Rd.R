library(lmerTest)


### Name: show_tests.anova
### Title: Show Hypothesis Tests in ANOVA Tables
### Aliases: show_tests.anova

### ** Examples


# Fit basic model to the 'cake' data:
data("cake", package="lme4")
fm1 <- lmer(angle ~ recipe * temp + (1|recipe:replicate), cake)

# Type 3 anova table:
(an <- anova(fm1, type="3"))

# Display tests/hypotheses for type 1, 2, and 3 ANOVA tables:
# (and illustrate effects of 'fractions' and 'names' arguments)
show_tests(anova(fm1, type="1"))
show_tests(anova(fm1, type="2"), fractions=TRUE, names=FALSE)
show_tests(an, fractions=TRUE)




