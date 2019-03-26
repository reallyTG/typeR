library(broom.mixed)


### Name: nlme_tidiers
### Title: Tidying methods for mixed effects models
### Aliases: nlme_tidiers tidy.lme augment.lme glance.lme tidy.gls

### ** Examples


if (require("nlme") && require("lme4")) {
    data("sleepstudy", package="lme4")
    ## original model
    ## Not run: 
##D          lmm1 <- lme(Reaction ~ Days, random=~ Days|Subject, sleepstudy)
##D     
## End(Not run)
    ## load stored object
    load(system.file("extdata","nlme_example.rda", package="broom.mixed"))
    tidy(lmm1)
    tidy(lmm1, effects = "fixed")
    tidy(lmm1, conf.int = TRUE)
    head(augment(lmm1, sleepstudy))
    glance(lmm1)

    startvec <- c(Asym = 200, xmid = 725, scal = 350)
    nm1 <- nlme(circumference ~ SSlogis(age, Asym, xmid, scal),
                  data = Orange,
                  fixed = Asym + xmid + scal ~1,
                  random = Asym ~1,
                  start = startvec)
    tidy(nm1)
    tidy(nm1, effects = "fixed")
    head(augment(nm1, Orange))
    glance(nm1)

    gls1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
                         correlation = corAR1(form = ~ 1 | Mare))
    tidy(gls1)
    glance(gls1)
}




