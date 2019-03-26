library(papeR)


### Name: Anova.lme
### Title: Anova Function for lme Models
### Aliases: Anova.lme
### Keywords: methods models

### ** Examples

## Example requires package nlme to be installed and loaded
if (require("nlme")) {
    ## Load data set Orthodont
    data(Orthodont, package = "nlme")

    ## Fit a model for distance with random intercept for Subject
    mod <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1 | Subject)

    Anova(mod)
}



