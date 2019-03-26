library(lme4)


### Name: ranef
### Title: Extract the modes of the random effects
### Aliases: ranef ranef.merMod dotplot.ranef.mer qqmath.ranef.mer
###   as.data.frame.ranef.mer
### Keywords: methods models

### ** Examples

require(lattice)
fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)
fm2 <- lmer(Reaction ~ Days + (1|Subject) + (0+Days|Subject), sleepstudy)
fm3 <- lmer(diameter ~ (1|plate) + (1|sample), Penicillin)
ranef(fm1)
str(rr1 <- ranef(fm1))
dotplot(rr1)  ## default
## specify free scales in order to make Day effects more visible
dotplot(rr1,scales = list(x = list(relation = 'free')))[["Subject"]]
ranef(fm2)
op <- options(digits = 4)
ranef(fm3, drop = TRUE)
options(op)
## as.data.frame() provides RE's and conditional standard deviations:
str(dd <- as.data.frame(rr1))
if (require(ggplot2)) {
    ggplot(dd, aes(y=grp,x=condval)) +
        geom_point() + facet_wrap(~term,scales="free_x") +
        geom_errorbarh(aes(xmin=condval -2*condsd,
                           xmax=condval +2*condsd), height=0)
}



