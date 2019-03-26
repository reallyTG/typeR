library(mediation)


### Name: test.modmed
### Title: Significance Test for Moderated Mediation
### Aliases: test.modmed test.modmed.default test.modmed.mediate
###   test.modmed.mediate.order print.test.modmed.mediate
###   print.test.modmed.mediate.order

### ** Examples
 

# Examples with JOBS II Field Experiment

# **For illustration purposes a small number of simulations are used**

data(jobs)

# Fit mediator and outcome models allowing for interaction with moderator
b.int <- lm(job_seek ~ treat*age + econ_hard + sex, data=jobs)
d.int <- lm(depress2 ~ treat*job_seek*age + econ_hard + sex, data=jobs)

# Initial mediate fit
fit <- mediate(b.int, d.int, sims=50, treat="treat", mediator="job_seek")

# Test for significance of moderated mediation
test.modmed(fit, list(age = 20), list(age = 70), sims = 100)




