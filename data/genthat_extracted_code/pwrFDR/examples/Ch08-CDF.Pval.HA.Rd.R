library(pwrFDR)


### Name: CDF.Pval.HA
### Title: CDF of p-values for test statistics distribted under HA.
### Aliases: CDF.Pval.HA
### Keywords: FDR Benjamini Hochberg microarrays Multiple.Testing
###   average.power k.power lambda.power

### ** Examples

  ## First calculate an average power for a given set of parameters
  rslt.avgp <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)

  ## Now verify that G_A( gamma f ) = average.power

  gamma <- rslt.avgp$gamma
  f <- rslt.avgp$call$FDR

  GA.gma.f <- CDF.Pval.HA(u=gamma*f, r.1=2000/54675, effect.size=0.79, n.sample=46)

  c(G.A.of.gamma.f=GA.gma.f$CDF.Pval.HA, average.power=rslt.avgp$average.power)



