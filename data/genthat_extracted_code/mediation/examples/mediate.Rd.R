library(mediation)


### Name: mediate
### Title: Causal Mediation Analysis
### Aliases: mediate

### ** Examples
 
# Examples with JOBS II Field Experiment

# **For illustration purposes a small number of simulations are used**

data(jobs)

####################################################
# Example 1: Linear Outcome and Mediator Models
####################################################
b <- lm(job_seek ~ treat + econ_hard + sex + age, data=jobs)
c <- lm(depress2 ~ treat + job_seek + econ_hard + sex + age, data=jobs)

# Estimation via quasi-Bayesian approximation
contcont <- mediate(b, c, sims=50, treat="treat", mediator="job_seek")
summary(contcont)
plot(contcont)

## Not run: 
##D # Estimation via nonparametric bootstrap
##D contcont.boot <- mediate(b, c, boot=TRUE, sims=50, treat="treat", mediator="job_seek")
##D summary(contcont.boot)
## End(Not run)

# Allowing treatment-mediator interaction
d <- lm(depress2 ~ treat + job_seek + treat:job_seek + econ_hard + sex + age, data=jobs)
contcont.int <- mediate(b, d, sims=50, treat="treat", mediator="job_seek")
summary(contcont.int)

# Allowing ``moderated mediation'' with respect to age
b.int <- lm(job_seek ~ treat*age + econ_hard + sex, data=jobs)
d.int <- lm(depress2 ~ treat*job_seek*age + econ_hard + sex, data=jobs)
contcont.age20 <- mediate(b.int, d.int, sims=50, treat="treat", mediator="job_seek",
			covariates = list(age = 20))
contcont.age70 <- mediate(b.int, d.int, sims=50, treat="treat", mediator="job_seek",
			covariates = list(age = 70))
summary(contcont.age20)
summary(contcont.age70)

# Continuous treatment
jobs$treat_cont <- jobs$treat + rnorm(nrow(jobs))  # (hypothetical) continuous treatment
b.contT <- lm(job_seek ~ treat_cont + econ_hard + sex + age, data=jobs)
c.contT <- lm(depress2 ~ treat_cont + job_seek + econ_hard + sex + age, data=jobs)
contcont.cont <- mediate(b.contT, c.contT, sims=50, 
                    treat="treat_cont", mediator="job_seek",
                    treat.value = 4, control.value = -2)
summary(contcont.cont)

# Categorical treatment 
## Not run: 
##D b <- lm(job_seek ~ educ + sex, data=jobs)
##D c <- lm(depress2 ~ educ + job_seek + sex, data=jobs)
##D 
##D # compare two categories of educ --- gradwk and somcol
##D model.cat <- mediate(b, c, treat="educ", mediator="job_seek", sims=50, 
##D                      control.value = "gradwk", treat.value = "somcol")
##D summary(model.cat)
## End(Not run)

######################################################
# Example 2: Binary Outcome and Ordered Mediator
######################################################
## Not run: 
##D jobs$job_disc <- as.factor(jobs$job_disc)
##D b.ord <- polr(job_disc ~ treat + econ_hard + sex + age, data=jobs,
##D             method="probit", Hess=TRUE)
##D d.bin <- glm(work1 ~ treat * job_disc + econ_hard + sex + age, data=jobs,
##D             family=binomial(link="probit"))
##D ordbin <- mediate(b.ord, d.bin, sims=50, treat="treat", mediator="job_disc")
##D summary(ordbin)
##D 
##D # Using heteroskedasticity-consistent standard errors
##D require(sandwich)
##D ordbin.rb <- mediate(b.ord, d.bin, sims=50, treat="treat", mediator="job_disc",
##D             robustSE=TRUE)
##D summary(ordbin.rb)
## End(Not run)

######################################################
# Example 3: Quantile Causal Mediation Effect
######################################################
require(quantreg)
c.quan <- rq(depress2 ~ treat + job_seek + econ_hard + sex + age, data=jobs,
            tau = 0.5)  # median
contquan <- mediate(b, c.quan, sims=50, treat="treat", mediator="job_seek")
summary(contquan)

######################################################
# Example 4: GAM Outcome
######################################################
## Not run: 
##D require(mgcv)
##D c.gam <- gam(depress2 ~ treat + s(job_seek, bs="cr") + 
##D             econ_hard + sex + age, data=jobs)
##D contgam <- mediate(b, c.gam, sims=10, treat="treat", 
##D                 mediator="job_seek", boot=TRUE)
##D summary(contgam)
##D 
##D # With interaction
##D d.gam <- gam(depress2 ~ treat + s(job_seek, by = treat) + 
##D     s(job_seek, by = control) + econ_hard + sex + age, data=jobs)
##D contgam.int <- mediate(b, d.gam, sims=10, treat="treat", mediator="job_seek",
##D     control = "control", boot=TRUE)
##D summary(contgam.int)
## End(Not run)
######################################################
# Example 5: Multilevel Outcome and Mediator Models
######################################################
## Not run: 
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
##D # Output based on mediator group ("educ")
##D multilevel <- mediate(model.m, model.y, treat = "treat", 
##D               mediator = "job_dich", sims=50, group.out="educ")
##D 
##D # Output based on outcome group ("occp")
##D # multilevel <- mediate(model.m, model.y, treat = "treat", 
##D               mediator = "job_dich", sims=50) 
##D 
##D # Group-average effects  
##D summary(multilevel)
##D 
##D # Group-specific effects organized by effect
##D summary(multilevel, output="byeffect")
##D # plot(multilevel, group.plots=TRUE)
##D # See summary.mediate.mer and plot.mediate.mer for detailed explanations 
##D 
##D # Group-specific effects organized by group
##D summary(multilevel, output="bygroup")
##D # See summary.mediate.mer for detailed explanations 
## End(Not run)





