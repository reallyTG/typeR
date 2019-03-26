library(pwrFDR)


### Name: CDF.Pval
### Title: CDF of pooled (H0 and HA) population p-values
### Aliases: CDF.Pval
### Keywords: FDR Benjamini Hochberg microarrays Multiple.Testing
###   average.power k.power lambda.power

### ** Examples

  ## First calculate an average power for a given set of parameters
  rslt.avgp <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)

  ## Now verify that G( gamma f ) = gamma

  gamma <- rslt.avgp$gamma
  f <- rslt.avgp$call$FDR

  G.gma.f <- CDF.Pval(u=gamma*f, r.1=2000/54675, effect.size=0.79, n.sample=46)

  c(G.of.gamma.f=G.gma.f$CDF.Pval, gamma=gamma) 



