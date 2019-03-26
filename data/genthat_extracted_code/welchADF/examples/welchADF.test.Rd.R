library(welchADF)


### Name: welchADF.test
### Title: General Approximate Degrees of Freedom Solution for Inference
###   and Estimation
### Aliases: welchADF.test welchADF.test.formula welchADF.test.lm
###   welchADF.test.aov welchADF.test.lmer welchADF.test.default

### ** Examples

# Omnibus contrast only of those effects included, namely condition and sex (no interaction)
omnibus_LSM_formula <- welchADF.test(y ~ condition + sex, data = womenStereotypeData)
# Works well with update.default() method
omnibus_interact_formula <- update(omnibus_LSM_formula, . ~ condition*sex)
summary(omnibus_LSM_formula)
summary(omnibus_interact_formula)

# Fit a linear model using the built-in function stats::lm
lm.women <- lm(y ~ condition + sex, womenStereotypeData)

# Fit an Analysis of Variance model using the built-in function stats::aov
aov.women <- aov(lm.women)

# Now use the this object to apply a welchADF test to the same formula and data
omnibus_no_interact <- welchADF.test(lm.women, contrast = "omnibus")
omnibus_no_interactB <- welchADF.test(aov.women) # omnibus as well

# Integrates well with the update.default() method
omnibus_interact <- update(omnibus_no_interact, . ~ condition*sex)
summary(omnibus_no_interact)
summary(omnibus_interact)
# Two-way factorial design using the default interface. See the vignette.
omnibus_LSM <- welchADF.test(womenStereotypeData, response = "y", between.s = 
  c("condition", "sex"), contrast = "omnibus")
# Method update() also works with the welchADF.test.default interface
omnibus_trimmed <- update(omnibus_LSM, effect = "condition", trimming = TRUE)
pairwise_LSM <- update(omnibus_LSM, contrast = "all.pairwise", effect = c("condition", "sex"))
pairwise_trimmed <- update(pairwise_LSM, trimming = TRUE) # just trimming
pairwise_trimmed_boot <- update(pairwise_trimmed, bootstrap = TRUE) # trimming and bootstrapping
summary(omnibus_LSM)
pairwise_LSM
summary(pairwise_trimmed_boot)



