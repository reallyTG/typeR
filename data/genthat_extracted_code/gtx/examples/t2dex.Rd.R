library(gtx)


### Name: t2dex
### Title: Simulated example genotype and longitudinal phenotype data.
### Aliases: t2dex

### ** Examples

data(t2dex)
summary(subset(t2dex$data, select = c("Age", "Overweight", "T2D",
                                      "FollowupDays", "FollowupT2D")))

library(survival)
plot(survfit(Surv(FollowupDays,FollowupT2D) ~ Overweight,
                 data = t2dex$data), col = c("green", "red"))

mycoxph <- coxph(Surv(FollowupDays,FollowupT2D) ~ Overweight,
                 data = t2dex$data) # fit null model
data(t2d.scores)
assoc1 <- grs.onesnp.apply(t2d.scores, mycoxph) # single SNP association
## risk score fit from single SNPs
unlist(grs.summary(t2d.scores$coef, assoc1$beta, assoc1$se,
                   n = length(residuals(mycoxph))))

## compare direct analysis of subject-specific data
t2dex <- grs.make.scores(t2d.scores, t2dex)
coxph(Surv(FollowupDays,FollowupT2D) ~ Overweight + T2D2010.score,
      data = t2dex$data)



