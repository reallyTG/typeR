library(ciTools)


### Name: add_probs.lmerMod
### Title: Response Probabilities for Linear Mixed Models
### Aliases: add_probs.lmerMod

### ** Examples

dat <- lme4::sleepstudy

# Fit a random intercept model
fit <- lme4::lmer(Reaction ~ Days + (1|Subject), data = lme4::sleepstudy)

# What is the probability that a new reaction time will be less
# than 300? (given the random effects).
add_probs(dat, fit, q = 300)

# What is the probability that a new reaction time will be greater
# than 300? (ignoring the random effects).
add_probs(dat, fit, q = 300, includeRanef = FALSE, comparison = ">")




