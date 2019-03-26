library(reghelper)


### Name: ICC
### Title: Intra-class correlation.
### Aliases: ICC ICC.lme ICC.merMod

### ** Examples

# iris data, showing use with lme()
if (require(nlme, quietly=TRUE)) {
    model <- lme(Sepal.Width ~ 1, random=~1|Species, data=iris)
    ICC(model)  # .49 of variance is between-subjects
}

# iris data, showing use with lmer()
if (require(lme4, quietly=TRUE)) {
    model <- lmer(Sepal.Width ~ 1 + (1|Species), data=iris)
    ICC(model)  # .49 of variance is between-subjects
}



