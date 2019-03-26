library(broom.mixed)


### Name: glmmadmb_tidiers
### Title: Tidying methods for glmmADMB models
### Aliases: glmmadmb_tidiers glmmADMB_tidiers tidy.glmmadmb
###   augment.glmmadmb glance.glmmadmb

### ** Examples


if (require("glmmADMB") && require("lme4")) {
    ## original model
    ## Not run: 
##D         data("sleepstudy", package="lme4")
##D         lmm1 <- glmmadmb(Reaction ~ Days + (Days | Subject), sleepstudy,
##D                          family="gaussian")
##D     
## End(Not run)
    ## load stored object
    load(system.file("extdata","glmmADMB_example.rda",package="broom.mixed"))
    tidy(lmm1, effects = "fixed")
    tidy(lmm1, effects = "fixed", conf.int=TRUE)
    ## tidy(lmm1, effects = "fixed", conf.int=TRUE, conf.method="profile")
    ## tidy(lmm1, effects = "ran_vals", conf.int=TRUE)
    head(augment(lmm1, sleepstudy))
    glance(lmm1)

    glmm1 <- glmmadmb(cbind(incidence, size - incidence) ~ period + (1 | herd),
                  data = cbpp, family = "binomial")
    tidy(glmm1)
    tidy(glmm1, effects = "fixed")
    head(augment(glmm1, cbpp))
    glance(glmm1)

}



