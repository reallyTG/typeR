library(mediation)


### Name: medsens
### Title: Sensitivity Analysis for Causal Mediation Effects
### Aliases: medsens

### ** Examples
 

# Examples with JOBS II Field Experiment

# **For illustration purposes a small number of simulations are used**

data(jobs)

####################################################
# Example 1: Binary treatment 
####################################################
# Fit parametric models
b <- lm(job_seek ~ treat + econ_hard + sex + age, data=jobs)
c <- lm(depress2 ~ treat + job_seek + econ_hard + sex + age, data=jobs)

# Pass model objects through mediate function
med.cont <- mediate(b, c, treat="treat", mediator="job_seek", sims=50)
# med.cont <- mediate(b, c, treat="treat", mediator="job_seek", sims=50, robustSE = T)
# jobs$cluster <- rep(1:30, each = 30)[-1]
# med.cont <- mediate(b, c, treat="treat", mediator="job_seek", sims=50, cluster = jobs$cluster)

# Pass mediate output through medsens function
sens.cont <- medsens(med.cont, rho.by=.1, eps=.01, effect.type="both")

# Use summary function to display results
summary(sens.cont)

# Plot true ACMEs and ADEs as functions of rho
par.orig <- par(mfrow = c(2,2))
plot(sens.cont, main="JOBS", ylim=c(-.2,.2))

# Plot true ACMEs and ADEs as functions of "R square tildes"
plot(sens.cont, sens.par="R2", r.type="total", sign.prod="positive")
par(par.orig)

####################################################
# Example 2: Categorical treatment 
####################################################
## Not run: 
##D 
##D # Purely for illustration, think of educ as a ``treatment''
##D 
##D b <- lm(job_seek ~ educ + sex, data=jobs)
##D c <- lm(depress2 ~ educ + job_seek + sex, data=jobs)
##D 
##D # compare two categories of educ --- gradwk and somcol
##D med.cont <- mediate(b, c, treat="educ", mediator="job_seek", sims=50, 
##D                     control.value = "gradwk", treat.value = "somcol")
##D sens.cont <- medsens(med.cont, rho.by=.1, eps=.01, effect.type="both")
##D summary(sens.cont)
## End(Not run)



