library(multcomp)


### Name: cml
### Title: Chronic Myelogenous Leukemia survival data.
### Aliases: cml
### Keywords: datasets

### ** Examples


if (require("coxme")) {
    data("cml")
    ### one-sided simultaneous confidence intervals for many-to-one 
    ### comparisons of treatment effects concerning time of survival 
    ### modeled by a frailty Cox model with adjustment for further 
    ### covariates and center-specific random effect.
    cml_coxme <- coxme(Surv(time, status) ~ treatment + sex + age + riskgroup + (1|center), 
                       data = cml)
    glht_coxme <- glht(model = cml_coxme, linfct = mcp(treatment = "Dunnett"), 
                       alternative = "greater")
    ci_coxme <- confint(glht_coxme)
    exp(ci_coxme$confint)[1:2,]
}



