library(mediation)


### Name: summary.mediate.mer
### Title: Summarizing Output from Mediation Analysis of Multilevel Models
### Aliases: summary.mediate.mer print.summary.mediate.mer
###   print.summary.mediate.mer.2 print.summary.mediate.mer.3

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
##D # Group-average effects  
##D summary(multilevel)
##D 
##D # Group-specific effects organized by effect
##D summary(multilevel, output="byeffect")
##D 
##D # Group-specific effects organized by group
##D summary(multilevel, output="bygroup")
## End(Not run)



