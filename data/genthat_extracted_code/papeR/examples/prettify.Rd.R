library(papeR)


### Name: prettify
### Title: Make Pretty Summary and Anova Tables
### Aliases: prettify prettify.anova prettify.data.frame
###   prettify.summary.lm prettify.summary.glm prettify.summary.coxph
###   prettify.summary.lme prettify.summary.mer prettify.summary.merMod
###   prettifyPValue
### Keywords: methods models

### ** Examples

## Example requires package nlme to be installed and loaded
if (require("nlme")) {
    ## Load data set Orthodont
    data(Orthodont, package = "nlme")

    ######################################################################
    # Linear model
    ######################################################################

    ## Fit a linear model
    linmod <- lm(distance ~ age + Sex, data = Orthodont)
    ## Extract pretty summary
    prettify(summary(linmod))

    ## Extract anova (sequential tests)
    anova(linmod)
    ## now prettify it
    prettify(anova(linmod))

    ######################################################################
    # Random effects model (nlme)
    ######################################################################

    ### (fit a more suitable model with random effects)
    ## With package nlme:
    require("nlme")
    ## Fit a model for distance with random intercept for Subject
    mod <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1 | Subject)
    summary(mod)
    ## Extract fixed effects table, add confidence interval and make it pretty
    prettify(summary(mod))
    ## Extract fixed effects table only and make it pretty
    prettify(summary(mod), confint = FALSE)

    ######################################################################
    # Random effects model (lme4)
    ######################################################################

    set.seed(130913)

    ## With package lme4:
    if (require("lme4") && require("car")) {
        ## Fit a model for distance with random intercept for Subject
        mod4 <- lmer(distance ~ age + Sex + (1|Subject), data = Orthodont)
        summary(mod4)
        ## Extract fixed effects table and make it pretty
        prettify(summary(mod4))

        ## Extract and prettify anova (sequential tests)
        prettify(anova(mod4))

        ## Better: extract Anova (partial instead of sequential tests)
        library("car")
        Anova(mod4)
        ## now prettify it
        prettify(Anova(mod4))
    }

    ######################################################################
    # Cox model
    ######################################################################

    ## survival models
    if (require("survival")) {
        ## Load data set ovarian
        data(ovarian, package = "survival")

        ## fit a Cox model
        mod5 <- coxph(Surv(futime, fustat) ~ age, data=ovarian)
        summary(mod5)
        ## Make pretty summary
        prettify(summary(mod5))

        ## Make pretty summary
        prettify(Anova(mod5))
    }


    ######################################################################
    # ATTENTION when confint = TRUE: Do not modify or delete data
    ######################################################################

    ## Fit a linear model (same as above)
    linmod <- lm(distance ~ age + Sex, data = Orthodont)
    ## Extract pretty summary
    prettify(summary(linmod))

    ## Change the data (age in month instead of years)
    Orthodont$age <- Orthodont$age * 12
    prettify(summary(linmod))  ## confidence intervals for age have changed
                               ## but coefficients stayed the same; a
                               ## warning is issued

    ## Remove data in fitting environment
    rm(Orthodont)
    prettify(summary(linmod))  ## confidence intervals are missing as no
                               ## data set was available to refit the model



    ######################################################################
    # Use confint to specify confidence interval without refitting
    ######################################################################

    ## make labels without using the data set
    labels <- c("distance", "age", "Subject", "Sex")
    names(labels) <- labels

    ## usually easier via: labels(Orthodont)

    prettify(summary(linmod), confint = confint(linmod),
             labels = labels)
}



