library(psycho)


### Name: mpe
### Title: Compute Maximum Probability of Effect (MPE).
### Aliases: mpe

### ** Examples

library(psycho)
library(rstanarm)

fit <- rstanarm::stan_glm(rating ~ advance, data = attitude)
posterior <- psycho::analyze(fit)$values$effects$advance$posterior
mpe <- psycho::mpe(posterior)
print(mpe$MPE)
print(mpe$values)



