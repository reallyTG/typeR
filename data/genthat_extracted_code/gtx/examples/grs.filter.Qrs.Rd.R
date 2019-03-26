library(gtx)


### Name: grs.filter.Qrs
### Title: Filter SNPs for inclusion in genetic risk score using
###   heterogeneity test.
### Aliases: grs.filter.Qrs

### ** Examples

  data(magic.scores)
  score1 <- subset(magic.scores, score == "FG2010")
  score1 <- within(score1, okay <- grs.filter.Qrs(coef, beta_TG, se_TG))
  with(score1, {grs.plot(coef, beta_TG, se_TG, locus);
    title(xlab = "FG effect", ylab = "TG effect")})
  with(score1, locus[!okay]) # loci removed
  with(subset(score1, okay), {grs.plot(coef, beta_TG, se_TG, locus);
    title(xlab = "FG effect", ylab = "TG effect")})



