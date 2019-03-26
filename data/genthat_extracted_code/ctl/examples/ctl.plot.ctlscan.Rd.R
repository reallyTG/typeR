library(ctl)


### Name: plot.CTLscan
### Title: Plot CTL results as bar, line or GWAS plot.
### Aliases: plot.CTLscan
### Keywords: hplot

### ** Examples

  library(ctl)
  data(ath.result)       # Arabidopsis thaliana results
  data(ath.metabolites)  # Arabidopsis thaliana data (phenotypes, genotypes and mapinfo

  plot(ath.result[[3]])
  plot(ath.result[[2]], mapinfo = ath.metab[[3]])
  plot(ath.result[[1]], mapinfo = ath.metab[[3]])
  plot(ath.result[[3]], mapinfo = ath.metab[[3]])
  plot(ath.result[[3]], mapinfo = ath.metab[[3]], type="gwas")
  plot(ath.result[[3]], mapinfo = ath.metab[[3]], type="line")



