library(mediation)


### Name: plot.mediate.mer
### Title: Plotting Indirect, Direct, and Total Effects from Mediation
###   Analysis of Multilevel Models
### Aliases: plot.mediate.mer

### ** Examples
 
# Examples with JOBS II Field Experiment

# **For illustration purposes a small number of simulations are used**
## Not run: 
##D data(jobs)
##D require(lme4)
##D 
##D # educ: mediator group
##D # occp: outcome group
##D 
##D # Varying intercept for mediator 
##D model.m <- glmer(job_dich ~ treat + econ_hard + (1 | educ), 
##D              		     family = binomial(link = "probit"), data = jobs)
##D 
##D # Varying intercept and slope for outcome
##D model.y <- glmer(work1 ~ treat + job_dich + econ_hard + (1 + treat | occp), 
##D                 family = binomial(link = "probit"), data = jobs)
##D 
##D # Output based on mediator group
##D multilevel <- mediate(model.m, model.y, treat = "treat", 
##D                       mediator = "job_dich", sims=50, group.out="educ")
##D 
##D #plot(multilevel, group.plots=TRUE)
## End(Not run)



