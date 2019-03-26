library(brglm)


### Name: brglm
### Title: Bias reduction in Binomial-response GLMs
### Aliases: brglm brglm.fit print.brglm summary.brglm print.summary.brglm
### Keywords: models regression iteration

### ** Examples

## Begin Example
data(lizards)
# Fit the GLM using maximum likelihood
lizards.glm <- brglm(cbind(grahami, opalinus) ~ height + diameter +
                  light + time, family = binomial(logit), data=lizards,
                  method = "glm.fit")
# Now the bias-reduced fit:
lizards.brglm <- brglm(cbind(grahami, opalinus) ~ height + diameter +
                  light + time, family = binomial(logit), data=lizards,
                  method = "brglm.fit")
lizards.glm
lizards.brglm
# Other links
update(lizards.brglm, family = binomial(probit))
update(lizards.brglm, family = binomial(cloglog))
update(lizards.brglm, family = binomial(cauchit))
# Using penalized maximum likelihood
update(lizards.brglm, family = binomial(probit), pl = TRUE)
update(lizards.brglm, family = binomial(cloglog), pl = TRUE)
update(lizards.brglm, family = binomial(cauchit), pl = TRUE)



