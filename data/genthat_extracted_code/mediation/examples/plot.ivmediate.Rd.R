library(mediation)


### Name: plot.ivmediate
### Title: Plotting Local Indirect, Direct, and Total Effects from
###   Mediation Analysis with Treatment Noncompliance
### Aliases: plot.ivmediate

### ** Examples
 
# Examples with JOBS II Field Experiment

# ** For illustration purposes a small number of simulations are used **

require(parallel)
require(MASS)

data(jobs)

a <- lm(comply ~ treat + sex + age + marital + nonwhite + educ + income, 
        data = jobs)
b <- glm(job_dich ~ comply + treat + sex + age + marital + nonwhite + educ + income, 
        data = jobs, family = binomial)
c <- lm(depress2 ~ job_dich * (comply + treat) + sex + age + marital + nonwhite + educ + income, 
        data = jobs)

out <- ivmediate(a, b, c, sims = 50, boot = FALSE,
                 enc = "treat", treat = "comply", mediator = "job_dich")
                 
summary(out)
plot(out)




