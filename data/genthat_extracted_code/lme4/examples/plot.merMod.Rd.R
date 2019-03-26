library(lme4)


### Name: plot.merMod
### Title: Diagnostic Plots for 'merMod' Fits
### Aliases: plot.merMod qqmath.merMod

### ** Examples

data(Orthodont,package="nlme")
fm1 <- lmer(distance ~ age + (age|Subject), data=Orthodont)
## standardized residuals versus fitted values by gender
plot(fm1, resid(., scaled=TRUE) ~ fitted(.) | Sex, abline = 0)
## box-plots of residuals by Subject
plot(fm1, Subject ~ resid(., scaled=TRUE))
## observed versus fitted values by Subject
plot(fm1, distance ~ fitted(.) | Subject, abline = c(0,1))
## residuals by age, separated by Subject
plot(fm1, resid(., scaled=TRUE) ~ age | Sex, abline = 0)
require("lattice")
qqmath(fm1, id=0.05)
if (require("ggplot2")) {
    ## we can create the same plots using ggplot2 and the fortify() function
    fm1F <- fortify.merMod(fm1)
    ggplot(fm1F, aes(.fitted,.resid)) + geom_point(colour="blue") +
           facet_grid(.~Sex) + geom_hline(yintercept=0)
    ## note: Subjects are ordered by mean distance
    ggplot(fm1F, aes(Subject,.resid)) + geom_boxplot() + coord_flip()
    ggplot(fm1F, aes(.fitted,distance))+ geom_point(colour="blue") +
        facet_wrap(~Subject) +geom_abline(intercept=0,slope=1)
    ggplot(fm1F, aes(age,.resid)) + geom_point(colour="blue") + facet_grid(.~Sex) +
        geom_hline(yintercept=0)+geom_line(aes(group=Subject),alpha=0.4)+geom_smooth(method="loess")
    ## (warnings about loess are due to having only 4 unique x values)
    detach("package:ggplot2")
}



