library(survminer)


### Name: ggcoxfunctional
### Title: Functional Form of Continuous Variable in Cox Proportional
###   Hazards Model
### Aliases: ggcoxfunctional print.ggcoxfunctional

### ** Examples


library(survival)
data(mgus)
res.cox <- coxph(Surv(futime, death) ~ mspike + log(mspike) + I(mspike^2) +
    age + I(log(age)^2) + I(sqrt(age)), data = mgus)
ggcoxfunctional(res.cox,  data = mgus, point.col = "blue", point.alpha = 0.5)
ggcoxfunctional(res.cox, data = mgus, point.col = "blue", point.alpha = 0.5,
                title = "Pass the title", caption = "Pass the caption")





