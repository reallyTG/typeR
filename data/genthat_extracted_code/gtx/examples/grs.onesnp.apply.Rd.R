library(gtx)


### Name: grs.onesnp.apply
### Title: Convenience tool to fit a series of single-SNP models.
### Aliases: grs.onesnp.apply

### ** Examples

library(survival)
data(t2d.scores)
data(t2dex)

mycoxph <- coxph(Surv(FollowupDays,FollowupT2D) ~ Overweight,
                 data = t2dex$data) # fit null model
assoc1 <- grs.onesnp.apply(t2d.scores, mycoxph) # single SNP association
## risk score fit from single SNPs
unlist(grs.summary(t2d.scores$coef, assoc1$beta, assoc1$se,
                   n = length(residuals(mycoxph))))

## compare direct analysis of subject-specific data
t2dex <- grs.make.scores(t2d.scores, t2dex)
coxph(Surv(FollowupDays,FollowupT2D) ~ Overweight + T2D2010.score,
      data = t2dex$data)



