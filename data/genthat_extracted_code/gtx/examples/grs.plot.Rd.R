library(gtx)


### Name: grs.plot
### Title: Diagnostic plot for genetic risk score calculation from summary
###   statistics.
### Aliases: grs.plot

### ** Examples

data(t2dex)
library(survival)
mycoxph <- coxph(Surv(FollowupDays,FollowupT2D) ~ Overweight,
                 data = t2dex$data) # fit null model
data(t2d.scores)
assoc1 <- grs.onesnp.apply(t2d.scores, mycoxph) # single SNP association
## risk score fit from single SNPs
grs.plot(t2d.scores$coef, assoc1$beta, assoc1$se, t2d.scores$name)
title(xlab = "risk score weight", ylab = "estimated effect size")



