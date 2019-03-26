library(broom.mixed)


### Name: glmmTMB_tidiers
### Title: Tidying methods for glmmTMB models
### Aliases: glmmTMB_tidiers tidy.glmmTMB augment.glmmTMB glance.glmmTMB

### ** Examples

if (require("glmmTMB") && require("lme4")) {
    data("sleepstudy",package="lme4")
    ## original model:
    ## Not run: 
##D         lmm1 <- glmmTMB(Reaction ~ Days + (Days | Subject), sleepstudy)
##D     
## End(Not run)
    ## load stored object
    load(system.file("extdata","glmmTMB_example.rda",package="broom.mixed"))
    tidy(lmm1)
    tidy(lmm1, effects = "fixed")
    tidy(lmm1, effects = "fixed", conf.int=TRUE)
    tidy(lmm1, effects = "fixed", conf.int=TRUE, conf.method="uniroot")
    ## FIX: tidy(lmm1, effects = "ran_vals", conf.int=TRUE)
    head(augment(lmm1, sleepstudy))
    glance(lmm1)

    ## original model:
    ##  glmm1 <- glmmTMB(incidence/size ~ period + (1 | herd),
    ##                  data = cbpp, family = binomial, weights=size)
    tidy(glmm1)
    tidy(glmm1, effects = "fixed")
    head(augment(glmm1, cbpp))
    head(augment(glmm1, cbpp, type.residuals="pearson"))
    glance(glmm1)
}



