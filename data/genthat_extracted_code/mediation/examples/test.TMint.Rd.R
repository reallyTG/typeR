library(mediation)


### Name: test.TMint
### Title: Significance Test for Treatment-Mediator Interaction in Causal
###   Mediation Analysis
### Aliases: test.TMint test.TMint.default test.TMint.mediate
###   test.TMint.mediate.order print.htest.order

### ** Examples
 

# Examples with JOBS II Field Experiment

# **For illustration purposes a small number of simulations are used**

data(jobs)

# Fit mediator and outcome models allowing for treatment-mediator interaction
b <- lm(job_seek ~ treat + econ_hard + sex + age, data=jobs)
d <- lm(depress2 ~ treat*job_seek + econ_hard + sex + age, data=jobs)

# Test for significance of interaction
fit <- mediate(b, d, sims=50, treat="treat", mediator="job_seek")
test.TMint(fit)




